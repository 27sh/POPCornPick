//package com.example.POPCornPickApi.controller.TerRiek;
//
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.example.POPCornPickApi.entity.Cinema;
//import com.example.POPCornPickApi.service.ReservationService;
//
//@RestController
//@CrossOrigin("*")
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
//				.body(null);
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
//				.body(null);
//	}
//	
//	@GetMapping("/special/count")
//	public ResponseEntity<Map<String, String>> getSpecialCount(){
//		
//		reservationService.getCountPerSpecial();
//		
//		return ResponseEntity.status(HttpStatus.OK)
//				.body(null);
//	}
//	
//}
