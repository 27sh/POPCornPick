package com.example.POPCornPickView.KKMController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/film")
public class FilmController {

	@RequestMapping("/movieList")
	public String movieList() {
		
		return "movieList";
	}
	
	@RequestMapping("/movieDetail")
	public String movieDetail() {
		
		return"common/movieDetail";
	}
	
}
