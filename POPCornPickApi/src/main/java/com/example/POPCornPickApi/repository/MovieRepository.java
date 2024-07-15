package com.example.POPCornPickApi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Movie;

public interface MovieRepository extends JpaRepository<Movie, Long>{
	Optional<Movie> findByTitle(String title);
	public Movie findByMovieDC(Long movieDC);
	public List<Movie> findAllByOrderByTitleAsc();
	
	@Query("select m.movieDC from Movie m where m.title = :title")
	public Long findMovieDCByTitle(@Param("title") String title);
}
