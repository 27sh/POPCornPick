package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.RoomType;

public interface RoomTypeRepository extends JpaRepository<RoomType, Long>{
	List<RoomType> findAllByOrderByRoomNameAsc();
	
	@Query(value = "select small_type from room_type where room_type_no = :roomTypeNo", nativeQuery = true)
	public String getBigType(@Param("roomTypeNo") Long roomTypeNo);
	
	List<RoomType> findBySmallType(String smallType);

	public List<RoomType> findRoomTypeNoBySmallType(String smallType);
}
