package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class NoticeController {

	@RequestMapping("/noticeForm")
	public String NoticForm() {

		return "admin/noticeForm";
	}

	@RequestMapping("/noticeList")
	public String NoticList() {
		return "admin/noticeList";
	}
	
	@RequestMapping("/noticeDetail/{noticeNo}")
	public String NoticeDetial(@PathVariable("noticeNo") Long noticeNo, Model model) {
		
		model.addAttribute("noticeNo", noticeNo);
		System.out.println("노티스번호" + noticeNo);
		
		return"admin/noticeDetail";
	}
	
}
