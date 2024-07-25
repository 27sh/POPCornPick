package com.example.POPCornPickApi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.ReservatedSeat;

public interface ReservatedSeatRepository extends JpaRepository<ReservatedSeat, Long>{

	@Query(value = "select count(*) from reservated_seat WHERE schedule_no = :scheduleNo AND is_booked = true", nativeQuery = true)
	public int getCountByScheduleNo(@Param("scheduleNo")Long scheduleNo);
	
	@Query(value ="select * from reservated_seat where schedule_no = :scheduleNo and is_booked = true order by seat_row asc, seat_column asc", nativeQuery = true)
	public List<ReservatedSeat> getReservatedSeatByScheduleNo(@Param("scheduleNo") Long scheduleNo);
	
	public Optional<ReservatedSeat> findBySchedule_ScheduleNoAndSeatRowAndSeatColumn(Long scheduleNo, int seatRow, int seatColumn);
	
	List<ReservatedSeat> findByScheduleScheduleNoIn(List<Long> scheduleNos);
}
