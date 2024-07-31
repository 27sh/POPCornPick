package com.example.POPCornPickView.controller.Gaksitan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/qnaList")
	public String qnaList() {
		return "/member/qnaList";
	}
	
	@GetMapping("/qnaDetail")
	public String qnaDetail(@RequestParam("qnaNo") Long qnaNo, Model model) {
		model.addAttribute("qnaNo", qnaNo);
		return "/member/qnaDetail";
	}
	
	@GetMapping("/editQnaForm")
	public String editQnaForm(@RequestParam("qnaNo") Long qnaNo, Model model) {
		model.addAttribute("qnaNo", qnaNo);
		return "/member/editQnaForm";
	}
	
	@GetMapping("/editMyInfo")
	public String editMyInfo() {
		return "/member/editMyInfo";
	}
	
	@GetMapping("/reservationList")
	public String reservationList() {
		return "/member/reservationList";
	}
	
	@GetMapping("/eventList")
	public String eventList() {
		return "/member/eventList";
	}
	
	
	
}
