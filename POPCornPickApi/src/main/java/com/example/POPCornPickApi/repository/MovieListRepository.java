package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.MovieList;

public interface MovieListRepository extends JpaRepository<MovieList, String>{
	public List<MovieList> findByMovieCd(MovieList movieCd);
}
