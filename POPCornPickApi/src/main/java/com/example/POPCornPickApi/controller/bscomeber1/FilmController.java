package com.example.POPCornPickApi.controller.bscomeber1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.service.MovieDetailService;

@RestController
@RequestMapping("/api/v1/film")
public class FilmController {

	@Autowired
	private MovieDetailService movieDetailService;
	
	@PostMapping("/saveMovieList")
	public String postmovieList() {
		
		return"";
	}
	
	 @GetMapping("/MovieList")
	 @CrossOrigin(origins = "http://localhost:8080")
	    public ResponseEntity<List<MovieDetail>> movieList() {
	        
		 System.out.println("무비리스트 화면인데 안나와서 시스아웃찍어보는중");
		 List<MovieDetail> movieDetails = movieDetailService.getAllMovieDetails();
	        return ResponseEntity.ok(movieDetails);
	    }
	
	@GetMapping("/movieDetail/{movieDC}")
	public ResponseEntity<MovieDetail> movieDetail(@PathVariable("movieDC") String movieDC) {
		
		
		MovieDetail moviedetail = movieDetailService.getMovieDetail(movieDC);
		
		
		return ResponseEntity.status(HttpStatus.OK).body(moviedetail);
	}
}
