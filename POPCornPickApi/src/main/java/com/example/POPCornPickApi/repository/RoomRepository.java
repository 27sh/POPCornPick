package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Long>{

	List<Room> findByRoomNo(Long roomNo);

	List<Room> findByCinema_CinemaNo(Long cinemaNo);

	@Query(value = "select COUNT(room_no) from room WHERE room_type_no = :roomTypeNo", nativeQuery = true)
	public int getCountByRoomTypeNo(@Param("roomTypeNo") Long roomTypeNo);
	public List<Room> findByRoomType_RoomTypeNoOrderByCinema_CinemaNameAsc(Long roomTypeNo);
}
