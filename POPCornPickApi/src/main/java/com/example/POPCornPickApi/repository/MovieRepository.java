package com.example.POPCornPickApi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Movie;

public interface MovieRepository extends JpaRepository<Movie, Long>{
	Optional<Movie> findByTitle(String title);
	public Movie findByMovieDC(Long movieDC);
	public List<Movie> findAllByOrderByTitleAsc();
}
