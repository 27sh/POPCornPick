package com.example.POPCornPickApi.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.MovieShowDetailRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class ReservationService {

	private CinemaRepository cinemaRepository;
	private ExpCinemaRepository expCinemaRepository;
	private RoomRepository roomRepository;
	private MovieRepository movieRepository;
	private MovieShowDetailRepository movieShowDetailRepository;
	private TicketingRepository ticketingRepository;
	
	public ReservationService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository, 
			RoomRepository roomRepository, MovieRepository movieRepository, MovieShowDetailRepository movieShowDetailRepository,
			TicketingRepository ticketingRepository) {
		this.cinemaRepository = cinemaRepository;
		this.expCinemaRepository = expCinemaRepository;
		this.roomRepository = roomRepository;
		this.movieRepository = movieRepository;
		this.movieShowDetailRepository = movieShowDetailRepository;
		this.ticketingRepository = ticketingRepository;
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
		
		int count4DX = roomRepository.getCountByRoomTypeNo(4L);
		int countIMAX = roomRepository.getCountByRoomTypeNo(3L);
		int countPRIVATE_BOX = roomRepository.getCountByRoomTypeNo(5L);
		
		countMap.put("4DX" , "4DX(" + count4DX + ")");
		countMap.put("IMAX" , "IMAX(" + countIMAX + ")");
		countMap.put("PRIVATE_BOX" , "PRIVATE BOX(" + countPRIVATE_BOX + ")");
	
		return countMap;
	}
	
	public List<Room> getCinemaByRoomTypeNo(Long roomTypeNo){
		
		List<Room> roomList = roomRepository.findByRoomType_RoomTypeNoOrderByCinema_CinemaNameAsc(roomTypeNo);
		
		return roomList;
	}
	
	public List<Movie> getMovieList(){
		
		List<Movie> movieList = movieRepository.findAll();
		
		List<MovieShowDetail> movieShowDetailList = movieShowDetailRepository.findAll();
		Map<Long, Long> countMap = new HashMap<>();
		movieShowDetailList.forEach(movieShowDetail -> {
			Long count = ticketingRepository.countByMovieShowDetail_DetailNo(movieShowDetail.getDetailNo());
			if(count > 0) {
				countMap.put(movieShowDetail.getDetailNo(), count);
			}
		});
		
		Set<Long> detailNoSet = new HashSet<>();
		
		for(int i = 0; i < countMap.size(); i++) {
			detailNoSet = countMap.keySet();
		}
		
		Map<Movie, Long> totalCountMap = new HashMap<>();
		
		detailNoSet.forEach(detailNo -> {
			MovieShowDetail movieShowDetail = movieShowDetailRepository.findByDetailNo(detailNo);
			Movie movie = movieRepository.findByMovieDC(movieShowDetail.getMovie().getMovieDC());
			if(totalCountMap.containsKey(movie)) {
				Long count = totalCountMap.get(movie);
				Long newCount = countMap.get(detailNo) + count;
				totalCountMap.remove(movie);
				totalCountMap.put(movie, newCount);
			}else {
				totalCountMap.put(movie, countMap.get(detailNo));				
			}
		});
		
		Map<Movie, Long> map = sortByValue(totalCountMap);
		System.out.println(map.values());
		System.out.println(map.keySet());
		return movieList;
	}
	
	public Map<Movie, Long> sortByValue(Map<Movie, Long> map) {
        List<Map.Entry<Movie, Long>> list = new LinkedList<>(map.entrySet());
        
        // 값(value)을 기준으로 정렬 (오름차순)
        Collections.sort(list, new Comparator<Map.Entry<Movie, Long>>() {
            @Override
            public int compare(Map.Entry<Movie, Long> o1, Map.Entry<Movie, Long> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        
        // 정렬된 엔트리를 LinkedHashMap에 넣어 순서를 유지하면서 맵을 구성
        Map<Movie, Long> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<Movie, Long> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        
        return sortedMap;
    }
	
}
