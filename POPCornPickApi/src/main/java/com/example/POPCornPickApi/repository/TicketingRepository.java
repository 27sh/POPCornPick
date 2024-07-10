package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.POPCornPickApi.entity.Ticketing;

public interface TicketingRepository extends JpaRepository<Ticketing, Long>{
	
	@Query(value = "SELECT m.title, COUNT(t.ticketing_no) AS ticketCount " +
            "FROM ticketing t " +
            "INNER JOIN movie_show_detail msd ON t.detail_no = msd.detail_no " +
            "INNER JOIN movie m ON msd.movie_dc = m.movieDC " +
            "GROUP BY m.title " +
            "ORDER BY ticketCount DESC", nativeQuery = true)
	List<Object[]> findTopMoviesByTicketCount();
	public Long countByMovieShowDetail_DetailNo(Long detailNo);
}
