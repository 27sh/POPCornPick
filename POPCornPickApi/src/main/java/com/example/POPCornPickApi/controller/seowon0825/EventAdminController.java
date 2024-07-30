package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.EventDto;
import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.entity.Participation;
import com.example.POPCornPickApi.service.EventService;
import com.example.POPCornPickApi.service.ParticipationService;


//@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/admin/event")
public class EventAdminController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	private final Path uploadDir2 = Paths.get("C:/upload");
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private ParticipationService participationService;
	
	@PostMapping
	public String eventRegistForm(EventDto eventDto) {
		Event event = new Event();
		String originName = eventDto.getFileName();
		
		event.setEventTitle(eventDto.getEventTitle());
		event.setEventContent(eventDto.getEventContent());
		event.setEventContent(eventDto.getEventContent());
		event.setStartEvent(eventDto.getStartEvent());
		event.setEndEvent(eventDto.getEndEvent());
		
		if(originName != null && !originName.isEmpty()) {
			event.setEventImgOriginName(originName);
			String newName = UUID.randomUUID().toString() + "_" + originName;
			event.setEventImgNewName(newName);
			File file = new File(uploadDir, newName);
			try {
				eventDto.getImgFile().transferTo(file);
				eventService.registEvent(event);
				return "이벤트 등록이 완료되었습니다.";
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
				return "파일 저장 중 에러 발생" + e.getMessage();
			}
		} else {
			boolean result = eventService.registEvent(event);
			if(result) {
				return "이벤트 등록이 완료되었습니다.";
			} else {
				System.out.println(result);
				return "다시 시도해 주세요.";
			}
		}
	}
	
	@GetMapping
	public List<Event> getAllEventList() {
		List<Event> list = eventService.getAllEventList();
		
		return list;
	}
	//진행중인 이벤트 리스트
	@GetMapping("/progress")
	public List<Event> getProgressEvent(){
		return eventService.getProgressEventList();
	}
	//종료된 이벤트 리스트
	@GetMapping("/end")
	public List<Event> getEndEventList(){
		return eventService.getEndEventList();
	}
	
	@GetMapping("/detail")
	public ResponseEntity<Event> getEventDetail(@RequestParam("eventNo") Long eventNo) {
		Event detail = eventService.getEventDetail(eventNo);
		System.out.println("detail : " + detail);
		if(detail != null) {
			return ResponseEntity.ok(detail);
		} else {
			return ResponseEntity.badRequest().body(null);
		}
	}
	
	
	@PutMapping
	public String eventModify(EventDto eventDto){
		System.out.println("eventController....putMapping...");
		Event event = new Event();
		String originName = eventDto.getFileName();
		
		event.setEventNo(eventDto.getEventNo());
		event.setEventTitle(eventDto.getEventTitle());
		event.setEventContent(eventDto.getEventContent());
		event.setEventContent(eventDto.getEventContent());
		event.setStartEvent(eventDto.getStartEvent());
		event.setEndEvent(eventDto.getEndEvent());
		
		System.out.println("eventDto : " + eventDto);
		System.out.println("event : " + event);
		System.out.println("originName : " + originName);
		if(originName != null && !originName.isEmpty()) {
			System.out.println("originName이 null이 아닐 때");
			event.setEventImgOriginName(originName);
			String newName = UUID.randomUUID().toString() + "_" + originName;
			event.setEventImgNewName(newName);
			File file = new File(uploadDir, newName);
			try {
				eventDto.getImgFile().transferTo(file);
				eventService.eventImgModify(event);
				System.out.println("파일 업로드 성공");
				return "이벤트 수정이 완료되었습니다.";
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
				return "파일 저장 중 에러 발생" + e.getMessage();
			}
		} else {
			System.out.println("originName이 null일 때");
			
			boolean result = eventService.eventModify(event);
			if(result) {
				return "이벤트 수정이 완료되었습니다.";
			} else {
				System.out.println(result);
				return "다시 시도해 주세요.";
			}
		}
	}
	
	@DeleteMapping
	public ResponseEntity<String> deleteEvent(@RequestParam("eventNo") Long eventNo){
		boolean result = eventService.deleteEvent(eventNo);
		if(result) {
			return ResponseEntity.ok("삭제가 완료되었습니다.");
		} else {
			return ResponseEntity.badRequest().body("다시 시도해주세요.");
		}
	}
	
	@GetMapping("/participationList")
	public ResponseEntity<List<Participation>> getParticipationList(){
		System.out.println("participationController.............");
		List<Participation> list= participationService.memberParticipationList();
		System.out.println(list);
		return ResponseEntity.ok(list);
	}
	
	
	
}
