package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.ReservatedSeat;

public interface ReservatedSeatRepository extends JpaRepository<ReservatedSeat, Long>{

	@Query(value = "select count(*) from reservated_seat WHERE schedule_no = :scheduleNo AND is_booked = true", nativeQuery = true)
	public int getCountByScheduleNo(@Param("scheduleNo")Long scheduleNo);
	
	@Query(value ="select * from reservated_seat where schedule_no = :scheduleNo and is_booked = true", nativeQuery = true)
	public List<ReservatedSeat> getReservatedSeatByScheduleNo(@Param("scheduleNo") Long scheduleNo);
}
