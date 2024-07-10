package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main() {
		
		return "common/main";
	}
	
	@RequestMapping("/event")
	public String event() {
		
		return "common/mainEventList";
	}
}
