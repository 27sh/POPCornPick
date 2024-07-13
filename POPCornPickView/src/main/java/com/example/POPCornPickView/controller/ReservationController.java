package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@RequestMapping("/main")
	public String reservation() {
		return "member/reservePage";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "member/index";
	}
}
