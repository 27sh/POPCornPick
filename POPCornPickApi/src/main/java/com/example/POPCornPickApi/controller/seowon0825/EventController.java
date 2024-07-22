package com.example.POPCornPickApi.controller.seowon0825;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Participation;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.service.EventService;
import com.example.POPCornPickApi.service.ParticipationService;


//@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/event")
public class EventController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	private final Path uploadDir2 = Paths.get("/Users/baeseowon/dev2/upload/");
	
	@Autowired
	private EventService eventService;
	@Autowired
	private JWTUtil jwtUtil;
	@Autowired
	private ParticipationService participationService;
	
	@PostMapping("/member/form")
	public ResponseEntity<String> memberEventForm(@RequestBody Map<String, Object> event,
			@RequestHeader("token") String token){
		Long eventNo = Long.valueOf(event.get("eventNo").toString());
		String eventContents = String.valueOf(event.get("contentsResult"));
		System.out.println(eventNo);
		System.out.println(eventContents);

		Event event1 = new Event();
		event1.setEventNo(eventNo);
		System.out.println(event1);
		
		String username = jwtUtil.getUsername(token);
		System.out.println(username);
		Member member = new Member();
		member.setUsername(username);
		
		Participation participation = new Participation();
		participation.setEvent(event1);
		participation.setMember(member);
		participation.setContentsResult(eventContents);
		participation.setParticipationResult("당첨");
		System.out.println(participation);
		
		boolean result = participationService.memberEventForm(participation);
		if(result) {
			return ResponseEntity.ok("이벤트에 참여해주셔서 감사합니다^^");
		} else {
			return ResponseEntity.badRequest().body("다시 시도해주세요.");
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
	
	
	
}
