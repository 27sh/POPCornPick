package com.example.POPCornPickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/movie")
public class AdminMovieController {
	
	@GetMapping("/list")
	public String getMovieList() {
		return "admin/movieList";
	}
	
	@GetMapping("/{movieDC}")
	public String getMovieDetailForm(@PathVariable("movieDC") String movieDC, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("movieDC", movieDC);
		return "redirect:/admin/movie/detail";
	}
	
	@GetMapping("/detail")
	public String goToDetailFormPage(Model model) {
		
		String movieDC = (String) model.getAttribute("movieDC");
		
		model.addAttribute("movieDC", movieDC);
		
		return "admin/movieForm";
	}
	
	
}
