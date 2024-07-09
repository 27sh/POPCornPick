package com.example.POPCornPickApi.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.MovieName;

public interface MovieNameRepository extends JpaRepository<MovieName, Long>{
	Optional<MovieName> findByTitle(String title);
}
