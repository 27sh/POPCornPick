package com.example.POPCornPickApi.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Ticketing;

public interface TicketingRepository extends JpaRepository<Ticketing, Long>{
	
	@Query(value = "SELECT m.title, COUNT(t.ticketingNo) AS ticketCount "
			+ "FROM Ticketing t "
			+ "JOIN t.reservatedSeat rs "
			+ "JOIN rs.schedule s "
			+ "JOIN s.movieShowDetail msd "
			+ "JOIN msd.movie m "
			+ "GROUP BY m.title  "
			+ "ORDER BY ticketCount DESC")
	public List<Object[]> getTopMoviesByTicketCount();
	
	
	@Query("SELECT COALESCE(COUNT(t.ticketingNo), 0) "
		     + "FROM Ticketing t "
		     + "JOIN t.reservatedSeat rs "
		     + "JOIN rs.schedule s "
		     + "JOIN s.movieShowDetail msd "
		     + "WHERE msd.detailNo = :detailNo")
	public Long getTicketingCountByDetailNo(@Param("detailNo") Long detailNo);
}
