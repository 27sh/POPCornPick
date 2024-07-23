package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Utube;
import com.example.POPCornPickApi.repository.UtubeRepository;

@Service
public class UtubeService {

	@Autowired
	private UtubeRepository utuberepository;
	
//	public List<Utube> showmeUTube(String movieDc){
//		
//		return utuberepository.findMovieDetailWithUtube(movieDc);
//	}
	
}
