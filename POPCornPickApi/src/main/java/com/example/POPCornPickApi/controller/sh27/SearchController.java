package com.example.POPCornPickApi.controller.sh27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.repository.MovieDetailRepository;

@RestController
@RequestMapping("api/v1/search")
public class SearchController {

	@Autowired
    private MovieDetailRepository movieDetailRepository;

	@GetMapping
    public List<MovieDetail> searchMovies(@RequestParam(name = "keyword") String keyword) {
        return movieDetailRepository.findByMovieNmContaining(keyword);
    }
}
