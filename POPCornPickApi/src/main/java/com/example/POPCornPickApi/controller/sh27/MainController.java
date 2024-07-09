package com.example.POPCornPickApi.controller.sh27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.service.MovieNameService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/v1/main")
@CrossOrigin(origins = "http://localhost:8080")
public class MainController {

    @Autowired
    private MovieNameService movieNameService;

    @GetMapping("/movies")
    public String getAllMovies(HttpServletRequest request) {
        List<String> movies = movieNameService.getAllMoviesWithDetails();
        request.setAttribute("movies", movies);
        return "movies";
    }
}
