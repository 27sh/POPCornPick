package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	@RequestMapping("/registForm")
	public String registForm() {
		return "admin/cinemaForm";
	}
	
	@RequestMapping("/list")
	public String getCinemaList() {
		return "admin/cinemaList";
	}
	
	@RequestMapping("/detail")
	public String getCinemaDetail() {
		return "admin/cinemaDetail";
	}
	
	@RequestMapping("/roomList")
	public String cinemaRoomList() {
		return "admin/cinemaRoomList";
	}
	
	@RequestMapping("/roomDetail")
	public String cinemaRoomSeatDetail() {
		return "admin/cinemaRoomDetail";
	}
	
}
