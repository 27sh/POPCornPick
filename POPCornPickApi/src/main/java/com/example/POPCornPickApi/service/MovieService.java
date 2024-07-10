package com.example.POPCornPickApi.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    private final String kobisApiKey = "12cc7dc453c4bb57c2342f243ea66220";
    private final String kobisApiUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=" + kobisApiKey + "&movieNm=";
    private final String tmdbApiKey = "4b5db8493a5df33fa9def848bcdda8b1";
    private final String tmdbApiUrl = "https://api.themoviedb.org/3/search/movie?api_key=" + tmdbApiKey + "&query=";

    public List<String> getAllMovies() {
        return movieRepository.findAll().stream().map(Movie::getTitle).collect(Collectors.toList());
    }

    public String getMovieDetails(String title) {
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();

        String kobisUrl = kobisApiUrl + title;
        String openStartDt = "Unknown";
        String viewAge = "Unknown";
        try {
            String kobisResponse = restTemplate.getForObject(kobisUrl, String.class);
            JsonNode kobisRoot = objectMapper.readTree(kobisResponse);
            JsonNode movieList = kobisRoot.path("movieListResult").path("movieList");
            if (movieList.isArray() && movieList.size() > 0) {
                JsonNode movieNode = movieList.get(0);
                openStartDt = movieNode.path("openDt").asText();
            }
        } catch (HttpServerErrorException e) {
            e.printStackTrace();
            return "{\"error\":\"KOBIS API server error: " + e.getMessage() + "\"}";
        } catch (RestClientException e) {
            e.printStackTrace();
            return "{\"error\":\"KOBIS API error: " + e.getMessage() + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\":\"Unknown error occurred\"}";
        }

        // Retrieve the viewAge from the local MovieRepository
        Optional<Movie> movieOptional = movieRepository.findByTitle(title);
        if (movieOptional.isPresent()) {
            Movie movie = movieOptional.get();
            viewAge = movie.getViewAge();
        }

        String tmdbUrl = tmdbApiUrl + title;
        String posterUrl = "https://via.placeholder.com/200x300";
        try {
            String tmdbResponse = restTemplate.getForObject(tmdbUrl, String.class);
            JsonNode tmdbRoot = objectMapper.readTree(tmdbResponse);
            JsonNode results = tmdbRoot.path("results");
            if (results.isArray() && results.size() > 0) {
                JsonNode movieNode = results.get(0);
                String posterPath = movieNode.path("poster_path").asText();
                posterUrl = "https://image.tmdb.org/t/p/w500" + posterPath;
            }
        } catch (HttpServerErrorException e) {
            e.printStackTrace();
            return "{\"error\":\"TMDB API server error: " + e.getMessage() + "\"}";
        } catch (RestClientException e) {
            e.printStackTrace();
            return "{\"error\":\"TMDB API error: " + e.getMessage() + "\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\":\"Unknown error occurred\"}";
        }

        String dDay = calculateDday(openStartDt);

        return "{\"title\":\"" + title + "\", \"openStartDt\":\"" + openStartDt + "\", \"posterUrl\":\"" + posterUrl + "\", \"viewAge\":\"" + viewAge + "\", \"dday\":\"" + dDay + "\"}";
    }

    private String calculateDday(String openStartDt) {
        if (openStartDt == null || openStartDt.isEmpty() || openStartDt.equals("Unknown")) {
            return "";
        }

        LocalDate today = LocalDate.now();
        LocalDate openDate = LocalDate.parse(openStartDt, DateTimeFormatter.ofPattern("yyyyMMdd"));
        long daysUntilOpen = ChronoUnit.DAYS.between(today, openDate);

        if (daysUntilOpen > 0) {
            return "D-" + daysUntilOpen;
        }
        return "";
    }
}
