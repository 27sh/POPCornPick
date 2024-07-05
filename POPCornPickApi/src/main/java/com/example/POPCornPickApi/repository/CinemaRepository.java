package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Cinema;
//극장
public interface CinemaRepository extends JpaRepository<Cinema, Long>{
	public Cinema findByCinemaNo(Long cinemaNo);
}
