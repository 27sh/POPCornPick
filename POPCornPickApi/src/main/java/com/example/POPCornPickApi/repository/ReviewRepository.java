package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Review;
//평점
import com.example.POPCornPickApi.entity.Ticketing;
	
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
	
	List<Review> findByTicketing_Member_Username(String username);
	
	//무비디테일 평점
	@Query("SELECT AVG(r.reviewScore) "
			+ "FROM Review r "
			+ "join r.ticketing t "
			+ "join t.reservatedSeat rs "
			+ "join rs.schedule s "
			+ "join s.movieShowDetail msd "
			+ "join msd.movie m "
			+ "where m.title = :title "
			+ "GROUP BY m.title")
	Double findAverageScore(@Param("title") String title);
	
	//무비디테일 평점수
	 @Query("SELECT COUNT(r) "
	 		 + "FROM Review r "
			 + "join r.ticketing t "
			 + "join t.reservatedSeat rs "
			 + "join rs.schedule s "
			 + "join s.movieShowDetail msd "
			 + "join msd.movie m "
			 + "where m.title = :title")
	 Long findTotalCount(@Param("title") String title);
	 
	 
	
	
}
