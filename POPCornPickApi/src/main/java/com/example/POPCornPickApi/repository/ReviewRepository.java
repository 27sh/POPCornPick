package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Review;
//평점
public interface ReviewRepository extends JpaRepository<Review, Long>{
	
	public List<Review> findByReviewNo(Review ReviewNo);
}
