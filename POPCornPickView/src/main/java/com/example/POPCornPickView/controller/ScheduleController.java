package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ScheduleController {
	
	@RequestMapping("/admin/schedulePage")
	public void schedulePage() {}
	
	@RequestMapping("/admin/scheduleDetail")
	public void scheduleDetail(@RequestParam("roomNo") Long roomNo, Model model) {
		model.addAttribute("roomNo", roomNo);
	}
	
	@RequestMapping("/common/scheduleList")
	public void scheduleList() {}
}
