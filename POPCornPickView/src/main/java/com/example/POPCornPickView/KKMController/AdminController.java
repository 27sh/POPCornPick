package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/qnaList")
	public String qnaListPage() {
		
		return"admin/qnaList";
	}
	
	@RequestMapping("/qnaEdit")
	public String qnaDetail() {
		
		return"admin/qnaEdit";
	}
	
}
