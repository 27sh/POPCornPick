package com.example.POPCornPickApi.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.dto.DailySalesDto;
import com.example.POPCornPickApi.dto.FmSaleDto;
import com.example.POPCornPickApi.dto.MonthlySalesDto;
import com.example.POPCornPickApi.dto.MovieSaleDto;
import com.example.POPCornPickApi.dto.YearSalesDto;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.entity.UnknownMember;

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
	
	List<Ticketing> findByReservatedSeatReservatedSeatNoIn(List<Long> reservatedSeatNos);
	
	public List<Ticketing> findByMember_UsernameAndViewTFAndReservatedSeat_Schedule_MovieShowDetail_Movie_MovieDC(String username, boolean viewTF, Long movieDC);
	
		
	public List<Ticketing> findByMember(Member username);
	
	public List<Ticketing> findByUnknownMember(UnknownMember unknownMember);
	
	@Query("SELECT new com.example.POPCornPickApi.dto.DailySalesDto(DATE(t.regdate), SUM(t.payTotalAmount)) " +
	           "FROM Ticketing t " +
	           "WHERE YEAR(t.regdate) = :year " +
	           "GROUP BY DATE(t.regdate)")
	public List<DailySalesDto> getDailySales(@Param("year") int year);

	 @Query("SELECT new com.example.POPCornPickApi.dto.MonthlySalesDto(CONCAT(YEAR(t.regdate), '-', MONTH(t.regdate)), SUM(t.payTotalAmount)) " +
	           "FROM Ticketing t " +
	           "WHERE YEAR(t.regdate) = :year " +
	           "GROUP BY YEAR(t.regdate), MONTH(t.regdate)")
	public List<MonthlySalesDto> getMonthlySales(@Param("year") int year);

	 @Query("SELECT new com.example.POPCornPickApi.dto.YearSalesDto(YEAR(t.regdate), SUM(t.payTotalAmount)) " +
	           "FROM Ticketing t " +
	           "GROUP BY YEAR(t.regdate)")
	 public List<YearSalesDto> getYearSales();
	
	 @Query("SELECT new com.example.POPCornPickApi.dto.MovieSaleDto(m.title, SUM(t.payTotalAmount), COUNT(t.payTotalAmount)) " +
		       "FROM Ticketing t " +
		       "JOIN t.reservatedSeat rs " +
		       "JOIN rs.schedule s " +
		       "JOIN s.movieShowDetail msd " +
		       "JOIN msd.movie m " +
		       "GROUP BY m.title " +
		       "ORDER BY SUM(t.payTotalAmount) DESC")
	public List<MovieSaleDto> getMoviesSales();
	
	@Query("SELECT new com.example.POPCornPickApi.dto.FmSaleDto(m.gender, COUNT(m.gender)) "
			+ "FROM Ticketing t "
			+ "JOIN t.member m "
			+ "GROUP BY m.gender ")
	public List<FmSaleDto> getFmSales();
	
	public List<Ticketing>findByReservatedSeat_Schedule_MovieShowDetail_Movie_Title(String title);
	
	public List<Ticketing> findByMember_UsernameAndViewTF(String username, boolean viewTF);
	
	 
}
