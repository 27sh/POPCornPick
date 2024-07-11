package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.repository.SeatRepository;

@Service
public class SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	public Object[] getCinemaRoomSeat(Long roomNo) {
		Object[] result = seatRepository.getRoomSeatStatsByRoomNo(roomNo);
		
		return result;
	}
}
