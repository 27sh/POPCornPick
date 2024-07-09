package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.RoomType;

public interface RoomTypeRepository extends JpaRepository<RoomType, Long>{
	List<RoomType> findAllByOrderByRoomNameAsc();
	
}
