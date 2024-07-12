package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Seat;
import com.example.POPCornPickApi.repository.SeatRepository;

@Service
public class SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	public int getCinemaRoomSeat(Long roomNo) {
		int result = seatRepository.getCinemaRoomSeatTotal(roomNo);
		System.out.println("total : " + result);
		return result;
	}
	
	public int getBookedSeat(Long roomNo) {
		int result = seatRepository.getCinemaRoomBookedSeat(roomNo);
		System.out.println("BookedCnt : " + result);
		return result;
	}
}
