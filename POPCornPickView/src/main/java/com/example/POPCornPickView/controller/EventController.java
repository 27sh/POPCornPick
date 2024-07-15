package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@RequestMapping("/sideBar")
	public String sideBar() {
		return "layout/serviceSideBar";
	}

	@RequestMapping("/regist")
	public String eventRegistForm() {
		return "event/admin/eventForm";
	}
	
	@RequestMapping("/allList")
	public String eventAllList() {
		return "event/admin/eventList";
	}
	
	@RequestMapping("/detail")
	public String eventDetail() {
		return "event/admin/eventDetail";
	}
	

}
