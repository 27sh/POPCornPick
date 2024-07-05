package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Event;

public interface EventRepository extends JpaRepository<Event, Long>{

}
