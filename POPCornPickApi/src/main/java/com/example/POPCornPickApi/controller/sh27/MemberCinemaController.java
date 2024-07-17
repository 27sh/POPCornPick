package com.example.POPCornPickApi.controller.sh27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.repository.CinemaRepository;

@RestController
@RequestMapping("/api/v1/memberCinema")
public class MemberCinemaController {
    
    @Autowired
    private CinemaRepository cinemaRepository;

    @GetMapping("/cinemaLocation/{location}")
    public List<Cinema> getCinemasByLocation(@PathVariable("location") String location) {
        return cinemaRepository.findByCinemaLocation(location);
    }
}
	