package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.ReservatedSeat;

public interface ReservatedSeatRepository extends JpaRepository<ReservatedSeat, Long>{

	@Query(value = "select count(*) from reservated_seat WHERE schedule_no = :scheduleNo AND is_booked = true", nativeQuery = true)
	public int getCountByScheduleNo(@Param("scheduleNo")Long scheduleNo);
}
