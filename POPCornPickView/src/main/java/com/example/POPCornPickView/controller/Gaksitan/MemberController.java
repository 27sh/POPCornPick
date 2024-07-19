package com.example.POPCornPickView.controller.Gaksitan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "/member/myInfo";
	}
	
	@GetMapping("/qnaForm")
	public String qnaForm() {
		return "/member/qnaForm";
	}
	
	
	
	
	
	
	
}
