package com.example.POPCornPickApi.controller.kyy1018;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.MovieDto;
import com.example.POPCornPickApi.dto.MovieShowDetailDto;
import com.example.POPCornPickApi.dto.ScheduleDto;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.Schedule;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.ScheduleRepository;

@RequestMapping("/api/v1/schedule")
@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class ScheduleController {
	
	@Autowired
	CinemaRepository cinemaRepository;
	
	@Autowired
	RoomRepository roomRepository;
	
	@Autowired
	ScheduleRepository scheduleRepository;
	
	@Autowired
	MovieRepository movieRepository;
	
	
	
//////	schedulePage
	
// 영화관 목록
	@GetMapping("/cinema")
	public ResponseEntity<List<Cinema>> cinemaList(){
		List<Cinema> list = cinemaRepository.findAll();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

// 상영관 목록
	@GetMapping("/cinema/{cinemaNo}")
	public ResponseEntity<List<Room>> roomList(@PathVariable("cinemaNo") Long cinemaNo){
		List<Room> list = roomRepository.findByCinema_CinemaNo(cinemaNo);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	
// 영화관 별 상영시간표 목록
	@GetMapping("/{roomNo}")
	public ResponseEntity<List<Schedule>> scheduleList(@PathVariable("roomNo") Long roomNo){
		List<Schedule> list = scheduleRepository.findByRoom_RoomNo(roomNo);
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	
//////	scheduleDetail
// 영화 슬롯 목록
	@GetMapping("/slot")
	public ResponseEntity<List<Movie>> movieSlot(){
		List<Movie> list = movieRepository.findAll();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
// 영화 슬롯 편집	
	@PutMapping("/slot")
	public ResponseEntity<Movie> movieSlotReg(@RequestBody MovieDto movieDto, @RequestParam("movieDc") Long movieDc) {
		Movie movie = movieRepository.findById(movieDc).get();
		System.out.println("현재 영화 : " + movie);
		
		movie.setColor(movieDto.getColor());
		
		Movie result = movieRepository.save(movie);
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
// 영화관 별 세부 상영시간표
	@GetMapping
	public ResponseEntity<List<Schedule>> scheduleList() {
		List<Schedule> list = scheduleRepository.findAll();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
		
			
// 영화관 별 세부 상영시간표 수정
	@PutMapping("/{regNo}")
	public ResponseEntity<Schedule> scheduleSave(@PathVariable("regNo") Long regNo, @RequestBody ScheduleDto scheduleDto) {
		Schedule schedule = scheduleRepository.findByRegNo(regNo).get();
		System.out.println("현재 일정 목록 :" + schedule);

		schedule.setStart(scheduleDto.getStart());
		schedule.setEnd(scheduleDto.getEnd());
		
		Schedule result = scheduleRepository.save(schedule);
		
		return new ResponseEntity<>(result, HttpStatus.OK);		
	}

	
}
