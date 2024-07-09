package com.example.POPCornPickApi.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Movie;

public interface MovieRepository extends JpaRepository<Movie, Long>{
	Optional<Movie> findByTitle(String title);
}
