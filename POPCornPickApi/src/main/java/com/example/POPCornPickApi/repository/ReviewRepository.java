package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Review;
//평점
	
public interface ReviewRepository extends JpaRepository<Review, Long>{
	public List<Review> findByReviewNo(Review ReviewNo);
	
	@Query("select r.reviewScore "
			+ "from Review r "
			+ "join r.ticketing t "
			+ "join t.reservatedSeat rs "
			+ "join rs.schedule s "
			+ "join s.movieShowDetail msd "
			+ "join msd.movie m "
			+ "where m.title = :title")
    public List<Integer> getReviewScoresByMovieTitle(@Param("title") String title);	

	List<Review> findByTicketingTicketingNoIn(List<Long> ticketingNos);
}
