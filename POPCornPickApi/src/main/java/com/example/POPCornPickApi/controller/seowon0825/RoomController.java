package com.example.POPCornPickApi.controller.seowon0825;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.service.RoomService;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin("*")
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@PostMapping("/room")
	public ResponseEntity<String> registRoom(@RequestBody RoomType roomType ) {
		int result = roomService.registRoom(roomType);
		System.out.println(result);
		if(result == 1) {
			return ResponseEntity.ok("상영관 등록이 완료되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("상영관 등록을 다시 해주세요.");
		}
		
	}
}
