package com.example.POPCornPickApi.service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.EventDto;
import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.repository.EventRepository;

@Service
public class EventService {

	@Autowired
    private EventRepository eventRepository;

	public List<Event> getCurrentEvents() {
        Date currentDate = new Date();
        List<Event> currentEvents = eventRepository.findAll().stream()
                .filter(event -> event.getEndEvent() == null || event.getEndEvent().after(currentDate))
                .collect(Collectors.toList());
        return currentEvents;
    }
	
	public boolean registEvent(Event event) {
		try {
			event = eventRepository.save(event);
			return true;
			
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
