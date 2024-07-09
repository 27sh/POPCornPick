package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.CinemaDto;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.service.CinemaService;
import com.example.POPCornPickApi.service.RoomService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/cinema")
public class CinemaController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private RoomService roomService;
	
	@PostMapping
	public @ResponseBody String registCinema(CinemaDto cinemaDto) {
		
		Cinema cinema = new Cinema();
		String originName = cinemaDto.getFileNema();
		cinema.setCinemaImgOriginName(originName);
		
		String newName = UUID.randomUUID().toString() + "_" + originName;
		cinema.setCinemaImgNewName(newName);
		
		File file = new File(uploadDir, newName);
		
		cinema.setCinemaIntro(cinemaDto.getCinemaIntro());
		cinema.setCinemaLocation(cinemaDto.getCinemaLocation());
		cinema.setCinemaAddr(cinemaDto.getCinemaAddr());
		cinema.setCinemaTel(cinemaDto.getCinemaTel());
		cinema.setCinemaName(cinemaDto.getCinemaName());
		
		try {
			cinemaDto.getImgfile().transferTo(file);
			System.out.println("파일 업로드 성공");
			boolean result = cinemaService.registCinema(cinema);
			System.out.println(result == true);
			if(result) {
				System.out.println("true");
				return "/img/" + newName;
			} else {
				System.out.println("false");
				return "다시 등록해 주세요.";
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return	"파일 저장 중 에러 발생 : " + e.getMessage();
		}
	}
	
	@GetMapping("/room")
	public ResponseEntity<List<RoomType>> roomList() {
		List<RoomType> list = roomService.getRoomList();
		System.out.println(list);
		if(!list.isEmpty()) {
			return ResponseEntity.ok(list);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
}
