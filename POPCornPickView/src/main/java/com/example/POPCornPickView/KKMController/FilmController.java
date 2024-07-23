package com.example.POPCornPickView.KKMController;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/film")
public class FilmController {

	@RequestMapping("/movieList")
	public String movieList() {
		
		return "movieList";
	}
	
	@RequestMapping("/noapi")
	public String root() {
		return "common/movieList2";
	}
	
	
	@RequestMapping("/movieDetail/{movieDC}")
	public String movieDetail(@PathVariable("movieDC") String movieDC, Model model) {
		
		model.addAttribute("movieDC", movieDC);
		System.out.println("디테일페이지 무비코드 확인-----" + movieDC);
		
		return"common/movieDetail";
	}
	
	
	
	
}
