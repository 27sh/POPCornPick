package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.RoomTypeRepository;

@Service
public class RoomService {

	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	public int registRoom(RoomType roomType) {
		try {
			roomTypeRepository.save(roomType);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public boolean registCinema(Cinema cinema) {
		System.out.println(cinema);
		try {
			System.out.println("try.........");
			cinemaRepository.save(cinema);
			return true;
		} catch(Exception e) {
			System.out.println("catch.........");
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
}
