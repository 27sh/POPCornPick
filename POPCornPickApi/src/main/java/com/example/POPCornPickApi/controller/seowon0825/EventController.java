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
import com.example.POPCornPickApi.entity.Point;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.service.EventService;
import com.example.POPCornPickApi.service.ParticipationService;
import com.example.POPCornPickApi.service.PointService;


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
	@Autowired
	private PointService pointService;
	
	@PostMapping("/member/form")
	public ResponseEntity<String> mbtiEventForm(@RequestBody Map<String, Object> event,
			@RequestHeader("token") String token){
		
		String username = jwtUtil.getUsername(token);
		System.out.println(username);
		Member member = new Member();
		member.setUsername(username);
		
		Long eventNo = Long.valueOf(event.get("eventNo").toString());
		String eventContents = String.valueOf(event.get("contentsResult"));
		System.out.println(eventNo);
		System.out.println(eventContents);

		int check = participationService.memberParticipationCheck(username, eventNo);

		System.out.println("result : " + check);
		
		if(check < 1) {
			Event event1 = new Event();
			event1.setEventNo(eventNo);
			System.out.println(event1);
			
			
			Participation participation = new Participation();
			participation.setEvent(event1);
			participation.setMember(member);
			participation.setContentsResult(eventContents);
			participation.setParticipationResult("당첨");
			System.out.println(participation);
			
			Point point = new Point();
			point.setMember(member);
			point.setPointType("이벤트 참여");
			point.setAcheive(500);
			
			boolean resultPoint = pointService.acheivePoint(point);
			System.out.println("point: " + resultPoint);
			boolean result = participationService.memberEventForm(participation);
			
			String mbtiInfo = null;
			if(result) {
				if(eventContents.equals("ENTJ")) {
					mbtiInfo = "비전을 가지고 타인을 활력적으로 인도하는 사람";
				} else if(eventContents.equals("ENTP")) {
					mbtiInfo = "풍부한 상상력으로 새로운 것에 도전하는 사람";
				} else if(eventContents.equals("ISFP")) {
					mbtiInfo = "따뜻한 감성을 가진 겸손한 사람";
				} else if(eventContents.equals("ISFJ")) {
					mbtiInfo = "성실하고 온화하며 협조를 잘 하는 사람";
				} else if(eventContents.equals("ENFJ")) {
					mbtiInfo = "타인의 성장을 도모하고 협동하는 사람";
				} else if(eventContents.equals("ISTP")) {
					mbtiInfo = "논리적이고 뛰어난 상황 적응력을 가진 사람";
				} else if(eventContents.equals("ENFP")) {
					mbtiInfo = "열정적으로 새로운 관계를 만드는 사람";
				} else if(eventContents.equals("ISTJ")) {
					mbtiInfo = "한 번 시작한 일은 끝까지 해내는 사람";
				} else if(eventContents.equals("ESFJ")) {
					mbtiInfo = "친절, 현실감을 바탕으로 타인에게 봉사하는 사람";
				} else if(eventContents.equals("INTP")) {
					mbtiInfo = "비평적인 관점을 가진 뛰어난 전략을 가진 사람";
				} else if(eventContents.equals("ESFP")) {
					mbtiInfo = "분위기를 고조시키는 우호적인 사람";
				} else if(eventContents.equals("INTJ")) {
					mbtiInfo = "전체를 조합하여 비전을 제시하는 사람";
				} else if(eventContents.equals("ESTJ")) {
					mbtiInfo = "사무적, 실용적, 현실적인 사람";
				} else if(eventContents.equals("ESTP")) {
					mbtiInfo = "친구, 운동, 음식 등 다양함을 선호하는 사람";
				} else if(eventContents.equals("INFJ")) {
					mbtiInfo = "사람에 관한 뛰어난 통찰력을 가진 사람";
				} else if(eventContents.equals("INFP")) {
					mbtiInfo = "이상적인 세상을 만들어가는 사람";
				}
				return ResponseEntity.ok(mbtiInfo);
			} else {
				return ResponseEntity.badRequest().body("다시 시도해주세요.");
			}
		} else {
			return ResponseEntity.badRequest().body("이미 참여한 이력이 있습니다.");
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
