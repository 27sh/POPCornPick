package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	@RequestMapping("/admin/schedulePage")
	public void schedulePage() {}
	
	@RequestMapping("/admin/scheduleDetail")
	public void scheduleDetail() {}
}
