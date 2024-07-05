package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Movie;

public interface MovieRepository extends JpaRepository<Movie, String>{
	public Movie findByMovieDc(String movieDc);
	
}
