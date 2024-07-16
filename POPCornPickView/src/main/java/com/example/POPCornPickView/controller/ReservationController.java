package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@RequestMapping("/main")
	public String reservation() {
		return "member/reservePage_main";
	}
	
	@RequestMapping("/seat/{scheduleNo}/{movieTitle}/{cinemaName}/{date}")
	public String seatSelection(@PathVariable("scheduleNo") Long scheduleNo, @PathVariable("movieTitle") String movieTitle,
			@PathVariable("cinemaName") String cinemaName, @PathVariable("date") String date,  RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addFlashAttribute("scheduleNo", scheduleNo);
		redirectAttributes.addFlashAttribute("movieTitle", movieTitle);
		redirectAttributes.addFlashAttribute("cinemaName", cinemaName);
		redirectAttributes.addFlashAttribute("date", date);
		return "redirect:/reservation/seat";
	}
	
	@RequestMapping("/seat")
	public String showSeatPage(Model model) {

		Long scheduleNo = (Long) model.getAttribute("scheduleNo");
		String movieTitle = (String) model.getAttribute("movieTitle");
		String cinemaName = (String) model.getAttribute("cinemaName");
		String date = (String) model.getAttribute("date");
		
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("movieTitle", movieTitle);
		model.addAttribute("cinemaName", cinemaName);
		model.addAttribute("date", date);
		
		return "member/reservePage_seatSelection";
	}
	
}
