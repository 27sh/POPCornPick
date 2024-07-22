package com.example.POPCornPickApi.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Event;

import jakarta.transaction.Transactional;

public interface EventRepository extends JpaRepository<Event, Long>{
	
	List<Event> findByEventNo(Event eventNo);
	
	@Modifying
	@Transactional
	@Query(value = "update Event set event_title = :eventTitle, event_content = :eventContent, start_event = :startEvent, end_event = :endEvent where event_no = :eventNo", nativeQuery = true)
	public int updateEventById(@Param("eventTitle") String eventTitle, @Param("eventContent") String eventContent, @Param("startEvent") Date startEvent, @Param("endEvent") Date endEvent,@Param("eventNo") Long eventNo);

	@Modifying
	@Transactional
	@Query(value = "delete from event where event_no = :eventNo", nativeQuery = true)
	public int deleteEventById(@Param("eventNo") Long eventNo);
	
	@Query(value = "select * from event where end_event >= CURDATE() order by start_event desc", nativeQuery = true)
	public List<Event> getProgressEventList();
	
	@Query(value = "select * from event where end_event < CURDATE() order by end_event desc", nativeQuery = true)
	public List<Event> getEndEventList();
	
	
	
}
