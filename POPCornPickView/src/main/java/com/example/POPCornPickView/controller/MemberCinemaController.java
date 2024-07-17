package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/memberCinema")
public class MemberCinemaController {
	
	@RequestMapping("/cinemaPage")
	public String list() {
		
		return "common/cinemaPage";
	}
}
