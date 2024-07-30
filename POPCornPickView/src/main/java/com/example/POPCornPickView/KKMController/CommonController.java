package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {

	@RequestMapping("/noticeList")
	public String noticeList() {
		
		return "common/noticeList";
	}
	
	@RequestMapping("/faqList")
	public String faqList() {
		
		return "common/faqList";
	}
	
	
}
