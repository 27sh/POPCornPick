package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Long>{

	List<Room> findByRoomNo(Long roomNo);

	List<Room> findByCinema_CinemaNo(Long cinemaNo);

}
