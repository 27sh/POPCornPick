package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.MovieDetail;

public interface MovieDetailRepository extends JpaRepository<MovieDetail, String>{

	public MovieDetail findByMovieDC(String movieDC);
	
	public List<MovieDetail> findByMovieNmContaining(String movieNm);

	public String findMovieNmByMovieDC(String movieDC); 
	
	
}
