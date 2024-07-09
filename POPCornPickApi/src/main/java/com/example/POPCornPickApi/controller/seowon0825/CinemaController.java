package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.CinemaDto;
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
	public @ResponseBody String registCinema(CinemaDto cinemaDto) {
		
		Cinema cinema = new Cinema();
		String originName = cinemaDto.getFileNema();
		cinema.setCinemaImgOriginName(originName);
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		cinema.setCinemaImgNewName(newName);
		
		File file = new File(newName);
		
		cinema.setCinemaIntro(cinemaDto.getCinemaIntro());
		cinema.setCinemaLocation(cinemaDto.getCinemaLocation());
		cinema.setCinemaAddr(cinemaDto.getCinemaAddr());
		cinema.setCinemaTel(cinemaDto.getCinemaTel());
		cinema.setCinemaName(cinemaDto.getCinemaName());
		
		boolean result = roomService.registCinema(cinema);
		System.out.println(result == true);
		if(result) {
			System.out.println("true");
			return newName;
		} else {
			System.out.println("false");
			return "다시 등록해 주세요.";
		}
		
	}
}
