package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "common/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "common/joinForm";
	}
	
	
	
}
