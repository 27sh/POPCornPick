package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.CinemaDto;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.RoomType;
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
			cinema = cinemaRepository.save(cinema);
			
			List<RoomType> roomTypes = roomTypeRepository.findAll();
			System.out.println("roomTypes: " + roomTypes);
			for(RoomType roomType : roomTypes) {
				System.out.println(roomTypes);
				Room room = new Room();
				room.setCinema(cinema);
				room.setRoomType(roomType);
				room = roomRepository.save(room);
				System.out.println("room 등록완료");
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
	
	public Cinema getCinemaDetail(Long cinemaNo) {
		Optional<Cinema> optionalCinema = cinemaRepository.findById(cinemaNo);
		Cinema cinemaDetail = optionalCinema.orElse(null);
		return cinemaDetail;
	}
	
	public boolean cinemaImgModify(Cinema cinema) {
		try {
			cinemaRepository.save(cinema);
			return true;
		} catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean cinemaModify(Cinema cinema) {
		System.out.println(cinema);
		try {
			int count = cinemaRepository.updateCinemaById(cinema.getCinemaNo(), cinema.getCinemaAddr(), cinema.getCinemaIntro(), cinema.getCinemaLocation(), cinema.getCinemaName(), cinema.getCinemaTel());
			if(count > 0) {
				System.out.println("수정 완료");
				return true;
			} else {
				System.out.println("수정 실패");
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Cinema> getCinemaLocationList(String cinemaLocation) {
		System.out.println(cinemaLocation);
		return cinemaRepository.findByCinemaLocation(cinemaLocation);
	}
	
	public Long getCinemaNo(String cinemaName) {
		System.out.println(cinemaName);
		Long cinemaNo = cinemaRepository.findByCinemaName(cinemaName);
		System.out.println(cinemaNo);
		return cinemaNo;
	}
	
	public String getCinemaName(Long cinemaNo) {
		return cinemaRepository.getCinemaName(cinemaNo);
	}
	
	public Long findCinemaNoByCinemaName(String cinemaName) {
        return cinemaRepository.findByCinemaName(cinemaName);
    }

    public Cinema findCinemaByCinemaName(String cinemaName) {
        Long cinemaNo = cinemaRepository.findByCinemaName(cinemaName);
        return cinemaNo != null ? cinemaRepository.findById(cinemaNo).orElse(null) : null;
    }
    
//    public List<Cinema> getSearchCinemaList(String searchCinemaList){
//    	String searchContent = "%" + searchCinemaList + "%";
//    	return cinemaRepository.getSearchCinemaList(searchContent);
//    }
    
	
}
