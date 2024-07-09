package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

	@RequestMapping("/registForm")
	public String registForm() {
		return "common/cinemaForm";
	}
	
	@RequestMapping("/list")
	public String getCinemaList() {
		return "common/cinemaList";
	}
}
