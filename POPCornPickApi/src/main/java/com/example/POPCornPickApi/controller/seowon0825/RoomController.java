package com.example.POPCornPickApi.controller.seowon0825;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/room")
public class RoomController {

	@PostMapping
	public String registRoom() {
		
		return "";
	}
}
