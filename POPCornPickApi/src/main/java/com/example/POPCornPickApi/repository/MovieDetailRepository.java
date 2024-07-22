package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.MovieDetail;

public interface MovieDetailRepository extends JpaRepository<MovieDetail, String>{

	public MovieDetail findByMovieDC(String movieDC);
	
}
