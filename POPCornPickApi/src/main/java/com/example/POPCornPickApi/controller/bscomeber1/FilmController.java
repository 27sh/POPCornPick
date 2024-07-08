package com.example.POPCornPickApi.controller.bscomeber1;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/film")
public class FilmController {

	@PostMapping("/saveMovieList")
	public String postmovieList() {
		
		
		
		return"";
	}
	
}
