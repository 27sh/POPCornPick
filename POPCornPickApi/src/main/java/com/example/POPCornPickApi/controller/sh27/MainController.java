package com.example.POPCornPickApi.controller.sh27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.service.MovieService;

@RestController
@RequestMapping("/api/v1/main")
@CrossOrigin(origins = "http://localhost:8080")
public class MainController {

    @Autowired
    private MovieService movieService;

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
}