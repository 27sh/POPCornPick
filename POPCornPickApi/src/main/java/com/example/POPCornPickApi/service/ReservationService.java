package com.example.POPCornPickApi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.RoomRepository;

@Service
public class ReservationService {

	private CinemaRepository cinemaRepository;
	private ExpCinemaRepository expCinemaRepository;
	private RoomRepository roomRepository;
	
	public ReservationService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository, RoomRepository roomRepository) {
		this.cinemaRepository = cinemaRepository;
		this.expCinemaRepository = expCinemaRepository;
		this.roomRepository = roomRepository;
	}
	
	public List<Cinema> getCinemaByLocaiton(String cinemaLocation){
		
		List<Cinema> cinemaList = cinemaRepository.findByCinemaLocationOrderByCinemaNameAsc(cinemaLocation);
		
		return cinemaList;
	}
	
	public Map<String, String> getCountPerLocation(){
		
		Map<String, String> countMap = new HashMap<>();

		// int countMyCinema = expCinemaRepository.countByUsername(username);
		int countSeoul = cinemaRepository.countByCinemaLocation("seoul");
		int countGyeonggi_incheon = cinemaRepository.countByCinemaLocation("gyeonggi_incheon");
		int countChungcheong_daejeon = cinemaRepository.countByCinemaLocation("chungcheong_daejeon");
		int countJeonla_gwangju = cinemaRepository.countByCinemaLocation("jeonla_gwangju");
		int countGyeongbuk_daegu = cinemaRepository.countByCinemaLocation("gyeongbuk_daegu");
		int countGyeongnam_busan_ulsan = cinemaRepository.countByCinemaLocation("gyeongnam_busan_ulsan");
		int countGangwon = cinemaRepository.countByCinemaLocation("gangwon");
		int countJeju = cinemaRepository.countByCinemaLocation("jeju");
		
		// countMap.put("myCinema", "My 영화관(" + countMyCinema + ")");
		countMap.put("seoul", "서울(" + countSeoul +")");
		countMap.put("gyeonggi_incheon", "경기/인천(" + countGyeonggi_incheon + ")");
		countMap.put("chungcheong_daejeon", "충청/대전(" + countChungcheong_daejeon + ")");
		countMap.put("jeonla_gwangju", "전라/광주(" + countJeonla_gwangju + ")");
		countMap.put("gyeongbuk_daegu", "경북/대구(" + countGyeongbuk_daegu + ")");
		countMap.put("gyeongnam_busan_ulsan", "경남/부산/울산(" + countGyeongnam_busan_ulsan + ")");
		countMap.put("gangwon", "강원(" + countGangwon + ")");
		countMap.put("jeju", "제주(" + countJeju + ")");
		
		return countMap;
	}
	
	public Map<String, String> getCountPerSpecial(){
		
		Map<String, String> countMap = new HashMap<>();
		
		int count4DX = roomRepository.getCountByRoomTypeNo(2L);
		int countIMAX = roomRepository.getCountByRoomTypeNo(3L);
		int countPRIVATE_BOX = roomRepository.getCountByRoomTypeNo(4L);
		
		countMap.put("4DX" , "4DX(" + count4DX + ")");
		countMap.put("IMAX" , "IMAX(" + countIMAX + ")");
		countMap.put("PRIVATE_BOX" , "4DX(" + countPRIVATE_BOX + ")");
	
		return countMap;
	}
	
	public List<Room> getCinemaByRoomTypeNo(Long roomTypeNo){
		
		List<Room> roomList = roomRepository.findByRoomType_RoomTypeNoOrderByCinema_CinemaNameAsc(roomTypeNo);
		
		return roomList;
	}
	
}
