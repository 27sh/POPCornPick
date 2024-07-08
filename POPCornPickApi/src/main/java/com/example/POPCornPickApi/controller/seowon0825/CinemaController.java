package com.example.POPCornPickApi.controller.seowon0825;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	public ResponseEntity<String> registCinema(@ModelAttribute Cinema cinema, @RequestParam("cinemaImg") MultipartFile file) {
		
		System.out.println("registCinema controller......");
		if(!file.isEmpty()) {
			try {
				String cinemaImg = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				String uploadFileName = uuid.toString() + "_" + cinemaImg;
				File saveFile = new File(uploadDir, uploadFileName);
				file.transferTo(saveFile);
				cinema.setCinemaImg(uploadFileName);
			} catch (IOException e) {
				e.printStackTrace();
				return ResponseEntity.status(500).body("파일 업로드 중 오류가 발생했습니다.");
			}
		}
		
		int result = roomService.registCinema(cinema);
		if(result == 1) {
			return ResponseEntity.ok("성공적으로 영화관 등록이 완료되었습니다.");
		} else {
			return ResponseEntity.badRequest().body("다시 등록해 주세요.");
		}
		
	}
}
