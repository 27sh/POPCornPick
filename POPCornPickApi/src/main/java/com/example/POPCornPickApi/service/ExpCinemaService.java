package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;

@Service
public class ExpCinemaService {

	@Autowired
	private ExpCinemaRepository expCinemaRepository;
	
	public List<ExpCinema> getFavoriteCinemas(String username) {
        return expCinemaRepository.findByMemberUsername(username);
    }
	
}
