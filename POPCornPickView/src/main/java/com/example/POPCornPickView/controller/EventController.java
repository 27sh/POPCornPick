package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/event")
public class EventController {

	@RequestMapping("/regist")
	public String eventRegistForm() {
		return "common/loginForm";
	}
}
