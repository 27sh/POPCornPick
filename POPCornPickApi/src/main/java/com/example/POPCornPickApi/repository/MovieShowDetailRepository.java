package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.POPCornPickApi.entity.MovieShowDetail;

public interface MovieShowDetailRepository extends JpaRepository<MovieShowDetail, Long>{
	public MovieShowDetail findByDetailNo(MovieShowDetail detailNo);
}
