package com.example.POPCornPickView.controller.Gaksitan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "/member/myInfo";
	}
	
	
	
}
