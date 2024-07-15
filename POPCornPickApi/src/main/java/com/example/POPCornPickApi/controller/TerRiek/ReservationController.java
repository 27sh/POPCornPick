//package com.example.POPCornPickApi.controller.TerRiek;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.hibernate.internal.build.AllowSysOut;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import com.example.POPCornPickApi.entity.Schedule;
//import com.example.POPCornPickApi.entity.Cinema;
//import com.example.POPCornPickApi.entity.Movie;
//import com.example.POPCornPickApi.entity.Room;
//import com.example.POPCornPickApi.service.ReservationService;
//
//@RestController
//// @CrossOrigin("*")
//@RequestMapping("/api/v1/reservation")
//public class ReservationController {
//	
//	private ReservationService reservationService;
//	
//	public ReservationController(ReservationService reservationService){
//		this.reservationService = reservationService;
//	}
//	
//	// 지역 선택시 지점 정보 가지고 오는 메소드
//	@GetMapping("/cinema/location/list/{cinemaLocation}")
//	public ResponseEntity<List<Cinema>> getCinemaByLocation(@PathVariable("cinemaLocation") String cinemaLocation){
//		
//		List<Cinema> cinemaList = reservationService.getCinemaByLocaiton(cinemaLocation);
//		
//		if(cinemaList != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(cinemaList);
//		}
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(new ArrayList<>());
//	}
//	
//	// My영화관, 지역별 지점 갯수 가지고 오는 메소드0
//	@GetMapping("/count")
//	public ResponseEntity<Map<String, String>> getCount(){
//		
//		Map<String, String> countMap = reservationService.getCountPerLocation();
//		
//		if(countMap != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(countMap);
//		}
//		
//		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
//				.body(new HashMap<>());
//	}
//	
//	@GetMapping("/special/count")
//	public ResponseEntity<Map<String, String>> getSpecialCount(){
//		
//		Map<String, String> countMap = reservationService.getCountPerSpecial();
//		
//		if(countMap != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(countMap);
//		}
//		
//		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
//				.body(new HashMap<>());
//	}
//	
//	@GetMapping("/cinema/special/list/{roomTypeNo}")
//	public ResponseEntity<List<Room>> getCinemaByRoomTypeNo(@PathVariable("roomTypeNo") Long roomTypeNo){
//		
//		List<Room> roomList = reservationService.getCinemaByRoomTypeNo(roomTypeNo);
//		
//		if(roomList != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(roomList);
//		}
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(new ArrayList<>());
//	}
//	
//	@GetMapping("/movie/list")
//	public ResponseEntity<List<Movie>> getMovie(){
//		
//		List<Movie> movieList = reservationService.getMovieList();
//		
//		if(movieList != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(movieList);
//		}
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(new ArrayList<>());
//	}
//	
//	@GetMapping("/movie/aboutto/list")
//	public ResponseEntity<List<Movie>> getMovieAboutToRelease(){
//		
//		List<Movie> movieList = reservationService.getAboutToMovieList();
//		
//		if(movieList != null) {
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(movieList);
//		}
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(new ArrayList<>());
//	}
//	
//	@GetMapping("/schedule/list/{cinemaName}/{movieTitle}/{date}")
//	public ResponseEntity<List<List<Schedule>>>root(@PathVariable("cinemaName") String cinemaName, 
//			@PathVariable("movieTitle") String movieTitle, @PathVariable("date") String date) {
//
//		List<List<Schedule>> scheduleListList = reservationService.getScheduleList(cinemaName, movieTitle, date);
//
//		if(scheduleListList != null) {
//			System.out.println("success");
//			return ResponseEntity.status(HttpStatus.OK)
//					.body(scheduleListList);
//		}
//
//		System.out.println("fail");
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(null);
//	}
//	
//	@GetMapping("/seat/left/{roomNo}")
//	public ResponseEntity<String> getSeatNoLeft(@PathVariable("roomNo") Long roomNo) {
//		
//		int leftSeats = reservationService.getSeatAmount(roomNo);
//		
//		String seatsNumber = String.valueOf(leftSeats);
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(seatsNumber);
//	}
//
//	
//	
//}
