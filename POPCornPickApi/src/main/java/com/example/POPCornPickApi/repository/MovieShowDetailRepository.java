package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.MovieShowDetail;

public interface MovieShowDetailRepository extends JpaRepository<MovieShowDetail, Long>{
	public MovieShowDetail findByDetailNo(MovieShowDetail detailNo);
}
