package com.example.POPCornPickApi.controller.Gaksitan;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/memInquiry")
public class MemberInquiryController {
	
	
	
	@PostMapping("/writeInquiry/{qnaCategory}")
	public String writeInquiry(@PathVariable("") String qnaCategory) {
		String str = "";
		
		
		
		
		
		return "";
	}
	
	
	
	
	
	
}
