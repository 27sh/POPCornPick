package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.repository.MovieDetailRepository;

@Service
public class MovieDetailService {

	@Autowired
	private MovieDetailRepository movieDetailRepository;
	
	public MovieDetail getMovieDetail(String movieDC) {
		
		return movieDetailRepository.findByMovieDC(movieDC);
	}
	
	
	public List<MovieDetail> getAllMovieDetails() {
        return movieDetailRepository.findAll();
    }
	
	
}
