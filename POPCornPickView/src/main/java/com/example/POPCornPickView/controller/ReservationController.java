package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@GetMapping(value = "/main", params = "!selectedCinemaNo")
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
	
	@GetMapping("/pay/{scheduleNo}/{movieTitle}/{cinemaName}/{date}/{time}/{typeCount}/{seatSelected}")
	public String givePayParameters(@PathVariable("scheduleNo") Long scheduleNo, @PathVariable("movieTitle") String movieTitle,
			@PathVariable("cinemaName") String cinemaName, @PathVariable("date") String date, @PathVariable("time") String time, 
			@PathVariable("typeCount") String typeCount, @PathVariable("seatSelected") String seatSelected, RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addFlashAttribute("scheduleNo", scheduleNo);
		redirectAttributes.addFlashAttribute("movieTitle", movieTitle);
		redirectAttributes.addFlashAttribute("cinemaName", cinemaName);
		redirectAttributes.addFlashAttribute("date", date);
		redirectAttributes.addFlashAttribute("time", time);
		redirectAttributes.addFlashAttribute("typeCount", typeCount);
		redirectAttributes.addFlashAttribute("seatSelected", seatSelected);
		
		return "redirect:/reservation/pay";
	}
	
	@RequestMapping("/pay")
	public String goToPay(Model model) {
		
		Long scheduleNo = (Long) model.getAttribute("scheduleNo");
		String movieTitle = (String) model.getAttribute("movieTitle");
		String cinemaName = (String) model.getAttribute("cinemaName");
		String date = (String) model.getAttribute("date");
		String time = (String) model.getAttribute("time");
		String typeCount = (String) model.getAttribute("typeCount");
		String seatSelected = (String) model.getAttribute("seatSelected");
		
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("movieTitle", movieTitle);
		model.addAttribute("cinemaName", cinemaName);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("typeCount", typeCount);
		model.addAttribute("seatSelected", seatSelected);
		
		return "member/reservePage_paySeats";
	}
	@GetMapping("/pay/result/{selectedCardName}/{scheduleNo}/{movieTitle}/{cinemaName}/{date}/{time}/{typeCount}/{seatSelected}/{beforeDiscount}/{discountTotal}/{payResult}")
	public String givePayResultParameters(@PathVariable("selectedCardName") String selectedCardName, @PathVariable("scheduleNo") Long scheduleNo, @PathVariable("movieTitle") String movieTitle,
			@PathVariable("cinemaName") String cinemaName, @PathVariable("date") String date, @PathVariable("time") String time, 
			@PathVariable("typeCount") String typeCount, @PathVariable("seatSelected") String seatSelected, @PathVariable("beforeDiscount") String beforeDiscount, 
			@PathVariable("discountTotal") String discountTotal, @PathVariable("payResult") String payResult, RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addFlashAttribute("selectedCardName", selectedCardName);
		redirectAttributes.addFlashAttribute("scheduleNo", scheduleNo);
		redirectAttributes.addFlashAttribute("movieTitle", movieTitle);
		redirectAttributes.addFlashAttribute("cinemaName", cinemaName);
		redirectAttributes.addFlashAttribute("date", date);
		redirectAttributes.addFlashAttribute("time", time);
		redirectAttributes.addFlashAttribute("typeCount", typeCount);
		redirectAttributes.addFlashAttribute("seatSelected", seatSelected);
		redirectAttributes.addFlashAttribute("beforeDiscount", beforeDiscount);
		redirectAttributes.addFlashAttribute("discountTotal", discountTotal);
		redirectAttributes.addFlashAttribute("payResult", payResult);
		
		return "redirect:/reservation/pay/result";
	}
	
	@RequestMapping("/pay/result")
	public String goToPayResult(Model model) {
		
		String selectedCardName = (String)model.getAttribute("selectedCardName");
		Long scheduleNo = (Long) model.getAttribute("scheduleNo");
		String movieTitle = (String) model.getAttribute("movieTitle");
		String cinemaName = (String) model.getAttribute("cinemaName");
		String date = (String) model.getAttribute("date");
		String time = (String) model.getAttribute("time");
		String typeCount = (String) model.getAttribute("typeCount");
		String seatSelected = (String) model.getAttribute("seatSelected");
		String beforeDiscount = (String) model.getAttribute("beforeDiscount");
		String discountTotal = (String) model.getAttribute("discountTotal");
		String payResult = (String) model.getAttribute("payResult");
		
		model.addAttribute("selectedCardName", selectedCardName);
		model.addAttribute("scheduleNo", scheduleNo);
		model.addAttribute("movieTitle", movieTitle);
		model.addAttribute("cinemaName", cinemaName);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("typeCount", typeCount);
		model.addAttribute("seatSelected", seatSelected);
		model.addAttribute("beforeDiscount", beforeDiscount);
		model.addAttribute("discountTotal", discountTotal);
		model.addAttribute("payResult", payResult);
		
		return "member/reservePage_payResult";
	}
	
	@GetMapping(value = "/main", params="selectedCinemaNo")
	public String sendParameterToMain(@RequestParam("selectedCinemaNo") Long selectedCinemaNo,
			@RequestParam("selectedDate") String selectedDate, @RequestParam("selectedRoomNo") Long selectedRoomNo,
			@RequestParam("movieTitle") String movieTitle, @RequestParam("scheStart") String scheStart, RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addFlashAttribute("cinemaNo", selectedCinemaNo);
		redirectAttributes.addFlashAttribute("date", selectedDate);
		redirectAttributes.addFlashAttribute("roomNo", selectedRoomNo);
		redirectAttributes.addFlashAttribute("movieTitle", movieTitle);
		redirectAttributes.addFlashAttribute("scheduleStart", scheStart);
		
		
		return "redirect:/reservation";
	}
	
	@GetMapping("")
	public String getAndSendParameterToMain(Model model) {
		
		Long cinemaNo = (Long) model.getAttribute("cinemaNo");
		String date = (String) model.getAttribute("date");
		Long roomNo = (Long) model.getAttribute("roomNo");
		String movieTitle = (String) model.getAttribute("movieTitle");
		String scheduleStart = (String) model.getAttribute("scheduleStart");
		
		model.addAttribute("cinemaNo", cinemaNo);
		model.addAttribute("date", date);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("movieTitle", movieTitle);
		model.addAttribute("scheduleStart", scheduleStart);
		
		return "member/reservePage_main";
	}
}
