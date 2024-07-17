package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/memManage")
public class MemManageController {

	@RequestMapping("/memState")
	public String memberState() {
		return "/admin/userList";
	}
}
