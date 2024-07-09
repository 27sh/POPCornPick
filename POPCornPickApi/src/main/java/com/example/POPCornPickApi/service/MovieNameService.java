package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.example.POPCornPickApi.entity.MovieName;
import com.example.POPCornPickApi.repository.MovieNameRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MovieNameService {

	@Autowired
    private MovieNameRepository movieNameRepository;

    private final String apiKey = "12cc7dc453c4bb57c2342f243ea66220";
    private final String apiUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=" + apiKey + "&movieNm=";

    public List<String> getAllMoviesWithDetails() {
        List<MovieName> movies = movieNameRepository.findAll();
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper objectMapper = new ObjectMapper();

        return movies.stream().map(movie -> {
            String url = apiUrl + movie.getTitle();
            String response = restTemplate.getForObject(url, String.class);
            try {
                JsonNode root = objectMapper.readTree(response);
                JsonNode movieList = root.path("movieListResult").path("movieList");
                if (movieList.isArray() && movieList.size() > 0) {
                    JsonNode movieNode = movieList.get(0);
                    return movieNode.path("movieNm").asText();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }).filter(title -> title != null).collect(Collectors.toList());
    }
}