package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Utube;

public interface UtubeRepository extends JpaRepository<Utube, Long>{

//	  @Query(value = "SELECT a.moviedc, b.video_url " +
//	  "FROM movie_detail AS a " +
//	  "JOIN utube AS b ON a.moviedc = b.movie_dc " +
//	  "WHERE a.moviedc = :moviedc", nativeQuery = true)
//	  public List<Object[]> findMovieDetailWithUtube(@Param("moviedc") String moviedc);

	  public List<Utube> findByMovie(MovieDetail movieDC);
	  }
