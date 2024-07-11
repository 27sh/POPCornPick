package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class NoticeController {

	@RequestMapping("/noticeForm")
	public String NoticForm() {
		
		
		return"admin/noticeForm";
	}
	
	
}
