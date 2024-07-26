package com.example.POPCornPickApi.controller.TerRiek;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.example.POPCornPickApi.entity.Schedule;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.dto.ReservationFinalPayDto;
import com.example.POPCornPickApi.dto.ScheduleDto_JYC;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Coupon;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.GiftCard;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.Point;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.service.ReservationService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
// @CrossOrigin("*")
@RequestMapping("/api/v1/reservation")
public class ReservationController {
	
	private ReservationService reservationService;
	private JWTUtil jwtUtil;
	
	public ReservationController(ReservationService reservationService, JWTUtil jwtUtil){
		this.reservationService = reservationService;
		this.jwtUtil = jwtUtil;
	}
	
	// 지역 선택시 지점 정보 가지고 오는 메소드
	@GetMapping("/cinema/location/list/{cinemaLocation}")
	public ResponseEntity<List<Cinema>> getCinemaByLocation(@PathVariable("cinemaLocation") String cinemaLocation){
		
		List<Cinema> cinemaList = reservationService.getCinemaByLocaiton(cinemaLocation);
		
		if(cinemaList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(cinemaList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(new ArrayList<>());
	}
	
	// My영화관, 지역별 지점 갯수 가지고 오는 메소드0
	@GetMapping("/count")
	public ResponseEntity<Map<String, String>> getCount(HttpServletRequest request){
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		Map<String, String> countMap = reservationService.getCountPerLocation(username);
		
		if(countMap != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(countMap);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(new HashMap<>());
	}
	
	@GetMapping("/special/count")
	public ResponseEntity<Map<String, String>> getSpecialCount(){
		
		Map<String, String> countMap = reservationService.getCountPerSpecial();
		
		if(countMap != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(countMap);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(new HashMap<>());
	}
	
	@GetMapping("/cinema/special/list/{roomTypeNo}")
	public ResponseEntity<List<Room>> getCinemaByRoomTypeNo(@PathVariable("roomTypeNo") Long roomTypeNo){
		
		List<Room> roomList = reservationService.getCinemaByRoomTypeNo(roomTypeNo);
		
		if(roomList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(roomList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(new ArrayList<>());
	}
	
	@GetMapping("/movie/list")
	public ResponseEntity<List<Movie>> getMovie(){
		
		List<Movie> movieList = reservationService.getMovieList();
		
		if(movieList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(new ArrayList<>());
	}
	
	@GetMapping("/movie/aboutto/list")
	public ResponseEntity<List<Movie>> getMovieAboutToRelease(){
		
		List<Movie> movieList = reservationService.getAboutToMovieList();
		
		if(movieList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(movieList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(new ArrayList<>());
	}
	
	@GetMapping("/schedule/list/{cinemaName}/{movieTitle}/{date}")
	public ResponseEntity<List<List<ScheduleDto_JYC>>>getScheduleList(@PathVariable("cinemaName") String cinemaName, 
			@PathVariable("movieTitle") String movieTitle, @PathVariable("date") String date) {

		List<List<ScheduleDto_JYC>> scheduleListList = reservationService.getScheduleList(cinemaName, movieTitle, date);

		if(scheduleListList != null) {
			System.out.println("success");
			return ResponseEntity.status(HttpStatus.OK)
					.body(scheduleListList);
		}

		System.out.println("fail");
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/schedule/list/{cinemaName}/{movieTitle}/{date}/{smallType}")
	public ResponseEntity<List<List<ScheduleDto_JYC>>>getSpecialScheduleList(@PathVariable("cinemaName") String cinemaName, 
			@PathVariable("movieTitle") String movieTitle, @PathVariable("date") String date, @PathVariable("smallType") String smallType) {
		
		List<List<ScheduleDto_JYC>> scheduleListList = reservationService.getSpecialScheduleList(cinemaName, movieTitle, date, smallType);

		if(scheduleListList != null) {
			System.out.println("success");
			return ResponseEntity.status(HttpStatus.OK)
					.body(scheduleListList);
		}

		System.out.println("fail");
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	
	@GetMapping("/seat/left/{roomNo}")
	public ResponseEntity<String> getSeatNoLeft(@PathVariable("roomNo") Long roomNo) {
		
		int leftSeats = reservationService.getSeatAmount(roomNo);
		
		String seatsNumber = String.valueOf(leftSeats);
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(seatsNumber);
	}
	
	@GetMapping("/seat/detail/{scheduleNo}")
	public ResponseEntity<ScheduleDto_JYC> getScheduleDetail(@PathVariable("scheduleNo") Long scheduleNo){
		
		ScheduleDto_JYC scheduleDto = reservationService.getScheduleDetail(scheduleNo);
		
		if(scheduleDto != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(scheduleDto);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(null);
	}
	
	// My 영화관 리스트 출력 컨트롤리
	@GetMapping("/myCinema/list")
	public ResponseEntity<List<ExpCinema>> getMyCinemaList(HttpServletRequest request){
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		List<ExpCinema> expCinemaList = reservationService.getMyCinemaList(username);
		
		if(expCinemaList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(expCinemaList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	// 개인 기프트카드 리스트 데이터 출력 컨트롤러
	@GetMapping("/my/gift/card")
	public ResponseEntity<List<GiftCard>> getMyValidGiftCard(HttpServletRequest request){
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		List<GiftCard> giftCardList = reservationService.getMyValidGiftCard(username);
		
		if(giftCardList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(giftCardList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	// 개인 할인쿠폰 리스트 데이터 출력 컨트롤러
	@GetMapping("/my/discount/coupon")
	public ResponseEntity<List<Coupon>> getMyValidDiscountCoupon(HttpServletRequest request){
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		List<Coupon> couponList = reservationService.getMyValidDiscountCoupon(username);
		
		if(couponList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(couponList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	// 개인 포인트 구하는 컨트롤러
	@GetMapping("/my/point")
	public ResponseEntity<Integer> getMyTotalPoint(HttpServletRequest request){
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		int myPoint = reservationService.getMyPoint(username);
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(myPoint);
	}
	
	@PostMapping("/final/pay/result")
	public ResponseEntity<String> getPayResult(@RequestBody ReservationFinalPayDto reservationFinalPay, HttpServletRequest request){

		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		String username = jwtUtil.getUsername(jwtToken);
		
		String result = reservationService.getPayResult(reservationFinalPay, username);
	
		return ResponseEntity.status(HttpStatus.OK)
				.body(result);
	}
	
	@GetMapping("/from/schedule/list/{cinemaNo}/{date}/{roomNo}/{movieTitle}/{scheduleStart}")
	public ResponseEntity<String> getScheduleListFromScheduleList(@PathVariable("cinemaNo") Long cinemaNo, @PathVariable("date") String date,
			@PathVariable("roomNo") Long roomNo, @PathVariable("movieTitle") String movieTitle, @PathVariable("scheduleStart") String scheduleStart){
		
		reservationService.getScheduleListFromScheduleList(cinemaNo, date, roomNo, movieTitle, scheduleStart);
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
}
