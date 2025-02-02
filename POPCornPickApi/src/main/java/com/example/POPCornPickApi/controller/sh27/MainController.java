package com.example.POPCornPickApi.controller.sh27;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Notice;
import com.example.POPCornPickApi.entity.Product;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.repository.NoticeRepository;
import com.example.POPCornPickApi.repository.ProductRepository;
import com.example.POPCornPickApi.service.EventService;
import com.example.POPCornPickApi.service.MovieService;
import com.example.POPCornPickApi.service.ReviewService;
import com.example.POPCornPickApi.service.RoomService;
import com.example.POPCornPickApi.service.TicketingService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("/api/v1/main")
//@CrossOrigin(origins = "http://localhost:8080")
public class MainController {

    @Autowired
    private MovieService movieService;
    
    @Autowired
    private TicketingService ticketingService;
    
    @Autowired
    private ReviewService reviewService;
    
    @Autowired
    private RoomService roomService;
    
    @Autowired
    private EventService eventService;
    
    @Autowired
    private ProductRepository productRepository;
    
    @Autowired
    private NoticeRepository noticeRepository;
    
    @Autowired
    private MovieDetailRepository movieDetailRepository;

    @GetMapping("/movies")
    public List<String> getAllMovies() {
        return movieService.getAllMovies();
    }

    @GetMapping("/movies/details/{title}")
    public String getMovieDetails(@PathVariable("title") String title) {
        try {
            return movieService.getMovieDetails(title);
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\":\"An error occurred\"}";
        }
    }
    
    @GetMapping("/movies/details")
    public List<String> getAllMovieDetails() {
        try {
            List<String> topMovies = ticketingService.getTopMoviesByTicketCount();
            List<String> movieDetails = new ArrayList<>();
            for (String title : topMovies) {
                double avgScore = reviewService.getAverageReviewScore(title);
                List<String> smallTypes = roomService.getSmallTypeByMovieTitle(title);
                String smallTypesJson = new ObjectMapper().writeValueAsString(smallTypes);
                String movieDetail = movieService.getMovieDetails(title);
                // 추가된 코드: movieDetail JSON 문자열에서 필요한 값을 파싱하여 dday 값을 포함
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode movieDetailJson = objectMapper.readTree(movieDetail);
                String dday = movieDetailJson.path("dday").asText();

                String movieDetailWithScoreAndType = movieDetail.substring(0, movieDetail.length() - 1) + ", \"avgReviewScore\":\"" + avgScore + "\", \"smallTypes\":" + smallTypesJson + ", \"dday\":\"" + dday + "\"}";
                movieDetails.add(movieDetailWithScoreAndType);
            }
            return movieDetails;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    @GetMapping("/top-movies")
    public List<String> getTopMoviesByTicketCount() {
        List<String> topMovies = ticketingService.getTopMoviesByTicketCount();
        System.out.println("Top Movies: " + topMovies); // 디버깅을 위해 출력
        return ticketingService.getTopMoviesByTicketCount();
    }
    
    @GetMapping("/events")
    public List<Event> getEvents() {
        return eventService.getCurrentEvents();
    }
    
    @GetMapping("/packages")
    public List<Product> getPackageProducts() {
        return productRepository.findTop3ByProductType("패키지");
    }
    
    @GetMapping("/storeMovies")
    public List<Product> getStoreMoviesProducts() {
        return productRepository.findTop3ByProductType("영화관람권");
    }
    
    @GetMapping("/gift")
    public List<Product> getGiftProducts() {
        return productRepository.findTop3ByProductType("기프트카드");
    }
    
    @GetMapping("/latest")
    public Notice getLatestNotice() {
        return noticeRepository.findFirstByOrderByRegdateDesc();
    }
    
    @GetMapping("/movies/details/title/{title}")
    public ResponseEntity<MovieDetail> getMovieDetailByTitle(@PathVariable("title") String title) {
        MovieDetail movieDetail = movieDetailRepository.findByMovieNm(title);
        if (movieDetail != null) {
            return ResponseEntity.ok(movieDetail);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
