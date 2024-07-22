package com.example.POPCornPickView.KKMController;

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
	
	@RequestMapping("/movieDetail/{moviceDC}")
	public String movieDetail(@PathVariable("movieDC") String movieDC, Model model) {
		
		
		String fixedMovieDC = "20240641";
		
//		model.addAttribute("movieDC", movieDC);
//		System.out.println("영화디씨" + movieDC);
		
		model.addAttribute("movieDC", fixedMovieDC);
		System.out.println("확인용으로 손석구나오는 영화를 무비코드로 집어넣은 나중에 수정하세요" + fixedMovieDC);

		
		return"common/movieDetail";
	}
	
}
