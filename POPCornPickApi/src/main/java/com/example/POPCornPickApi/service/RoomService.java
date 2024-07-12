package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.RoomTypeRepository;

@Service
public class RoomService {

	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	public int registRoom(RoomType roomType) {
		try {
			roomTypeRepository.save(roomType);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<RoomType> getRoomList(){
		System.out.println("service : " + roomTypeRepository.findAllByOrderByRoomNameAsc());
		return roomTypeRepository.findAllByOrderByRoomNameAsc();		
	}
	
	public List<String> getSmallTypeByMovieTitle(String title) {
        return roomRepository.findSmallTypeByMovieTitle(title);
    }
	
	public List<Long> getRoomNo(Long cinemaNo){
		return roomRepository.findRoomNoByCinemaNo(cinemaNo);
	}
	
	public List<Room> getRoomInfo(Long roomNo) {
		List<Room> result = roomRepository.getRoomInfo(roomNo);
		return result;
	}
	
	public String getBigType(Long roomTypeNo) {
		return roomTypeRepository.getBigType(roomTypeNo);

	}
	
}
