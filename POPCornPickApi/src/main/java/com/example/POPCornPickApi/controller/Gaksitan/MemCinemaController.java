package com.example.POPCornPickApi.controller.Gaksitan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.repository.CinemaRepository;

@RestController
@RequestMapping("/api/v1")
public class MemCinemaController {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	@GetMapping("/cinemaList")
	public List<String> cinemaList(@RequestParam("location") String location) {
		
		if(!location.equals("My 영화관")) {
			List<String> cinemaList = cinemaRepository.getCinemaNameListByLocation(location);
			
			return cinemaList;
		}
		
		
		
		return null;
		
	}
	
	
}
