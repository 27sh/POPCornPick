package com.example.POPCornPickApi.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.entity.Participation;
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
	//전체 이벤트
	public List<Event> getAllEventList(){
		return eventRepository.findAll();
	}
	//진행중인 이벤트
	public List<Event> getProgressEventList(){
		return eventRepository.getProgressEventList();
	}
	//종료된 이벤트
	public List<Event> getEndEventList(){
		return eventRepository.getEndEventList();
	}
	
	public Event getEventDetail(Long eventNo) {
		Optional<Event> optionalEvent = eventRepository.findById(eventNo);
		Event eventDetail = optionalEvent.orElse(null);
		return eventDetail;
	}
	
	public boolean eventImgModify(Event event) {
		try {
			eventRepository.save(event);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean eventModify(Event event) {
		System.out.println("modifyService.....");
		System.out.println("eventService : " + event);
		try {
			int count = eventRepository.updateEventById(event.getEventTitle(), event.getEventContent(), event.getStartEvent(), event.getEndEvent(), event.getEventNo());
			System.out.println("count: " + count);
			if(count > 0) {
				System.out.println("수정 완료");
				return true;
			} else {
				System.out.println("수정 실패");
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteEvent(Long eventNo) {
		int result = eventRepository.deleteEventById(eventNo);
		if(result > 0) {
			System.out.println("삭제 성공");
			return true;
		} else {
			System.out.println("삭제 실패");
			return false;
		}
	}
	
	
	
}
