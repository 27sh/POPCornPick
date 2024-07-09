package com.example.POPCornPickApi.controller.seowon0825;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.service.RoomService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/cinema")
public class CinemaController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@Autowired
	private RoomService roomService;
	
	@PostMapping
	public String registCinema(Cinema cinema) {
		boolean result = roomService.registCinema(cinema);
		System.out.println(result == true);
		if(result) {
			System.out.println("true");
			return "성공적으로 영화관 등록이 완료되었습니다.";
		} else {
			System.out.println("false");
			return "다시 등록해 주세요.";
		}
		
	}
}
