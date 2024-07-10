package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Cinema;
//극장
public interface CinemaRepository extends JpaRepository<Cinema, Long>{
	public List<Cinema> findByCinemaNo(Long cinemaNo);
	public List<Cinema> findByCinemaLocationOrderByCinemaNameAsc(String cinemaLocation);
	public int countByCinemaLocationOrderByCinemaNameAsc(String cinemaLocation);
}
