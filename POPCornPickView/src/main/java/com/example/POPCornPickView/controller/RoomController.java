package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

	@RequestMapping("/registForm")
	public String registForm() {
		
		return "common/roomForm";
	}
}
