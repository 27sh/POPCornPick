package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.EventDto;
import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.service.EventService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/event")
public class EventController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@Autowired
	private EventService eventService;
	
	@PostMapping
	public String eventRegistForm(EventDto eventDto) {
		
		Event event = new Event();
		String originName = eventDto.getFileName();
		
		event.setEventTitle(eventDto.getEventTitle());
		event.setEventContent(eventDto.getEventContent());
		event.setEventContent(eventDto.getEventContent());
		event.setStartEvent(eventDto.getStartEvent());
		event.setEndEvent(eventDto.getEndEvent());
		
		if(originName != null) {
			event.setEventImgOriginName(originName);
			String newName = UUID.randomUUID().toString() + "_" + originName;
			event.setEventImgNewName(newName);
			File file = new File(uploadDir, newName);
			try {
				eventDto.getImgFile().transferTo(file);
				System.out.println("파일 업로드 성공");
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
				return "파일 저장 중 에러 발생" + e.getMessage();
			}
		}
		boolean result = eventService.registEvent(event);
		if(result) {
			System.out.println(result);
			return "이벤트 등록이 완료되었습니다.";
		} else {
			System.out.println(result);
			return "다시 시도해 주세요.";
		}
	
	}
}
