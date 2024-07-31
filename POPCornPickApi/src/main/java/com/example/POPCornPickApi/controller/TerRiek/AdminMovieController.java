package com.example.POPCornPickApi.controller.TerRiek;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.MovieDetailWithTotalViewDto;
import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.service.MovieDetailService;


@RestController
@RequestMapping("/api/v1/admin/movie")
public class AdminMovieController {
	
	private MovieDetailService movieDetailService;
	
	public AdminMovieController(MovieDetailService movieDetailService) {
		this.movieDetailService = movieDetailService;
	}
	
	@GetMapping("/on")
	public ResponseEntity<List<MovieDetailWithTotalViewDto>> getMovieOn(){
		
		List<MovieDetailWithTotalViewDto> movieDetailList = movieDetailService.getMovieListOn();
		
		if(movieDetailList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieDetailList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/aboutto")
	public ResponseEntity<List<MovieDetailWithTotalViewDto>> getMovieAboutto(){
		
		List<MovieDetailWithTotalViewDto> movieDetailList = movieDetailService.getMovieListAboutto();
		
		if(movieDetailList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieDetailList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/detail/{movieDC}")
	public ResponseEntity<MovieDetail> getMovieDetail(@PathVariable("movieDC") String movieDC){
		
		MovieDetail movieDetail = movieDetailService.getMovieDetail(movieDC);
		
		if(movieDetail != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieDetail);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/search/{keyword}")
	public ResponseEntity<List<MovieDetail>> getSearchResult(@PathVariable("keyword") String keyword){
		
		List<MovieDetail> movieDetailList = movieDetailService.getSearchResult(keyword);
		
		if(movieDetailList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieDetailList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	
}
