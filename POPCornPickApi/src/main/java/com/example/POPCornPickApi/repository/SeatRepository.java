package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Seat;

public interface SeatRepository extends JpaRepository<Seat, Long>{

	//상영관 총 좌석 수
	@Query(value = "select count(*) as total from seat where room_no = :roomNo", 
            nativeQuery = true)
	public int getCinemaRoomSeatTotal(@Param("roomNo") Long roomNo);
	
	//예매 가능한 좌석 수 
	@Query(value = "select count(*) as bookedCnt from seat where room_no = :roomNo and is_booked = 0",
			nativeQuery = true)
	public int getCinemaRoomBookedSeat(@Param("roomNo") Long roomNo);
	
	
}
