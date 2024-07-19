package com.example.POPCornPickView.controller.Gaksitan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	
	@PostMapping("/nonMemberLogin")
	public @ResponseBody String nonMemberLogin(HttpServletRequest request) {
		String str = "";
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String birthdate = request.getParameter("birthdate");
		String password2 = request.getParameter("password2");
		
		session.setAttribute("name", name);
		session.setAttribute("tel", tel);
		session.setAttribute("birthdate", birthdate);
		session.setAttribute("password2", password2);
		
		return str;
	}
	
	
	
	
	
	
	
	
	
}
