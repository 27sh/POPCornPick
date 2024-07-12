package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Seat;

public interface SeatRepository extends JpaRepository<Seat, Long>{

	
	@Query(value = "select total.total, booked.bookedCnt, total.room_no\n"
			+ "from (select count(*) as total, room_no from seat where room_no = :roomNo) total\n"
			+ "left join (select count(*) as bookedCnt, room_no from seat where room_no = :roomNo and is_booked = 0) booked\n"
			+ "on total.room_no = booked.room_no;", 
            nativeQuery = true)
	public Object[] getRoomSeatStatsByRoomNo(@Param("roomNo") Long roomNo);

}
