package com.example.POPCornPickApi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Schedule;

public interface ScheduleRepository extends JpaRepository<Schedule, Long>{

	// Optional<Schedule> findByRegNo(Long regNo);

	List<Schedule> findByRoom_RoomNo(Long roomNo);

	public List<Schedule> findByMovieShowDetail_DetailNoOrderByStartAsc(Long detailNo);
	
	public Schedule findByScheduleNo(Long scheduleNo);
}
