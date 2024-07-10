//package com.example.POPCornPickApi.service;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.stereotype.Service;
//
//import com.example.POPCornPickApi.entity.Cinema;
//import com.example.POPCornPickApi.repository.CinemaRepository;
//import com.example.POPCornPickApi.repository.ExpCinemaRepository;
//
//@Service
//public class ReservationService {
//
//	private CinemaRepository cinemaRepository;
//	private ExpCinemaRepository expCinemaRepository;
//	
//	public ReservationService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository) {
//		this.cinemaRepository = cinemaRepository;
//		this.expCinemaRepository = expCinemaRepository;
//	}
//	
//	public List<Cinema> getCinemaByLocaiton(String cinemaLocation){
//		
//		List<Cinema> cinemaList = cinemaRepository.findByCinemaLocationOrderByCinameNameAsc(cinemaLocation);
//		
//		return cinemaList;
//	}
//	
//	public Map<String, String> getCountPerLocation(){
//		
//		Map<String, String> countMap = new HashMap<>();
//
//		int countMyCinema = expCinemaRepository.countByUsername(username);
//		int countSeoul = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("seoul");
//		int countGyeonggi_incheon = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("gyeonggi_incheon");
//		int countChungcheong_daejeon = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("chungcheong_daejeon");
//		int countJeonla_gwangju = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("jeonla_gwangju");
//		int countGyeongbuk_daegu = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("gyeongbuk_daegu");
//		int countGyeongnam_busan_ulsan = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("gyeongnam_busan_ulsan");
//		int countGangwon = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("gangwon");
//		int countJeju = cinemaRepository.countByCinemaLocationOrderByCinemaNameAsc("jeju");
//		
//		countMap.put("myCinema", "My 영화관(" + countMyCinema + ")");
//		countMap.put("seoul", "서울(" + countSeoul +")");
//		countMap.put("gyeonggi_incheon", "경기/인천(" + countGyeonggi_incheon + ")");
//		countMap.put("chungcheong_daejeon", "충청/대전(" + countChungcheong_daejeon + ")");
//		countMap.put("jeonla_gwangju", "전라/광주(" + countJeonla_gwangju + ")");
//		countMap.put("gyeongbuk_daegu", "경북/대구(" + countGyeongbuk_daegu + ")");
//		countMap.put("gyeongnam_busan_ulsan", "경남/부산/울산(" + countGyeongnam_busan_ulsan + ")");
//		countMap.put("gangwon", "강원(" + countGangwon + ")");
//		countMap.put("jeju", "제주(" + countJeju + ")");
//		
//		return countMap;
//		return null;
//	}
//	
//}
