package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.entity.Seat;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.RoomTypeRepository;
import com.example.POPCornPickApi.repository.SeatRepository;

@Service
public class CinemaService {

	@Autowired
	private CinemaRepository cinemaRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private SeatRepository seatRepository;
	
	public boolean registCinema(Cinema cinema) {
		try {
			System.out.println(cinema);
			cinema = cinemaRepository.save(cinema);
			
			List<RoomType> roomTypes = roomTypeRepository.findAll();
			
			for(RoomType roomType : roomTypes) {
				Room room = new Room();
				room.setCinema(cinema);
				room.setRoomType(roomType);
				System.out.println("room : "+room);
				room = roomRepository.save(room);
				
				System.out.println("getRoomTotalRow : "+roomType.getRoomTotalRow());
				System.out.println("getRoomTotalColumn : "+roomType.getRoomTotalColumn());
				for(int i = 1; i <= roomType.getRoomTotalRow() ; i++) {
					for(int j = 1 ; j <= roomType.getRoomTotalColumn() ;j++) {
						Seat seat = new Seat();
						seat.setRoom(room);
						seat.setSeatRow(i);
						seat.setSeatColumn(j);
						seat.setBooked(false);
						seatRepository.save(seat);
					}
				}
			}
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Cinema> getCinemaList(){
		return cinemaRepository.findAll();
	}
	
	
	
	
}
