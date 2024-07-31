package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/qnaList")
	public String qnaListPage() {
		
		return"admin/qnaList";
	}
	
	@RequestMapping("/qnaEdit/{qnaNo}")
	public String qnaDetail(@PathVariable("qnaNo") Long qnaNo, Model model) {
		
		model.addAttribute("qnaNo", qnaNo);
		System.out.println("일반 컨트롤러 qnaNo : " + qnaNo);
		return"admin/qnaEdit";
	}
	
	@RequestMapping("/faqForm")
	public String faqform() {
		
		return "admin/faqForm";
	}
	
	@RequestMapping("/faqEdit")
	public String faqEdit() {
		
		return "admin/faqEdit";
	}
	
	@RequestMapping("/faqList")
	public String faqList() {
		
		return "admin/faqList";
	}
	
}
