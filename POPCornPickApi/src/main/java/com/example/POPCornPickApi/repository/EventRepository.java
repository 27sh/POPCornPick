package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Event;

public interface EventRepository extends JpaRepository<Event, Long>{
	
	List<Event> findByEventNo(Event eventNo);
}
