package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Review;
//평점
public interface ReviewRepository extends JpaRepository<Review, Long>{
	
	public List<Review> findByReviewNo(Review ReviewNo);
	
	@Query("SELECT r.reviewScore FROM Review r JOIN r.ticketing t JOIN t.movieShowDetail msd JOIN msd.movie m WHERE m.title = :title")
    List<Integer> findReviewScoresByMovieTitle(@Param("title") String title);	
}
