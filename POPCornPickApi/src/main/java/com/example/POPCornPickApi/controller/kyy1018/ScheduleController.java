package com.example.POPCornPickApi.controller.kyy1018;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
import com.example.POPCornPickApi.repository.MovieShowDetailRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.ScheduleRepository;

@RequestMapping("/api/v1/schedule")
@CrossOrigin("*")
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
	
	@Autowired
	MovieShowDetailRepository movieShowDetailRepository;
	
	
	
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
	
// 영화 슬롯 상세
	@GetMapping("/slot/{movieDC}")
	public ResponseEntity<Movie> movieSlot(@PathVariable("movieDC") Long movieDC) {
		Movie result = movieRepository.findById(movieDC).get();
		return new ResponseEntity<>(result, HttpStatus.OK);
	}		
	
// 영화 슬롯 편집	
	@PutMapping("/slot/{movieDC}")
	public ResponseEntity<Movie> movieSlotReg(@RequestBody MovieDto movieDto, @PathVariable("movieDC") Long movieDC) {
		Movie movie = movieRepository.findById(movieDC).get();
		movie.setColor(movieDto.getColor());
		
		Movie result = movieRepository.save(movie);
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
// 영화관 별 상영시간표 세부페이지
//	@GetMapping("/room/{roomNo}")
//	public ResponseEntity<List<Schedule>> scheduleDetail(@PathVariable("roomNo") Long roomNo) {
//		List<Schedule> list = scheduleRepository.findByRoom_RoomNo(roomNo);
//		return new ResponseEntity<>(list, HttpStatus.OK);
//	}
		
			
	// 영화관 별 세부 상영시간표 수정
	@PutMapping("/{roomNo}")
	public ResponseEntity<List<Schedule>> scheduleSave(
	        @PathVariable("roomNo") Long roomNo,
	        @RequestBody List<ScheduleDto> scheduleDtos) {

		System.out.println("xxxxx");
		System.out.println(scheduleDtos);
	    // 기존 스케줄 목록을 가져옴
	    List<Schedule> existingSchedules = scheduleRepository.findByRoom_RoomNo(roomNo);
	    System.out.println("현재 일정 목록 :" + existingSchedules);
	    
	    List<Movie> mList = movieRepository.findAll();
	    Optional<Room> rList= roomRepository.findById(roomNo);
	    
	    System.out.println(rList);
	    
	    // 기존 스케줄 목록을 삭제 (주석 해제 필요)
	    // scheduleRepository.deleteAll(existingSchedules);

	    // 새로운 스케줄 목록을 생성
	    List<Schedule> newSchedules = scheduleDtos.stream().map(dto -> {
	        Schedule schedule = new Schedule();
	        schedule.setRoom(roomRepository.findById(dto.getRoomNo()).get());
  
	        if(movieShowDetailRepository.findById(dto.getDetailNo()) != null) {
	        	schedule.setMovieShowDetail(movieShowDetailRepository.findById(dto.getDetailNo()).get());
	        }else {
	        	
	        }
	        
	        
	        schedule.setStart(dto.getStart());
	        schedule.setEnd(dto.getEnd());
	        return schedule;
	    }).collect(Collectors.toList());

	    // 새로운 스케줄 목록을 저장
	    List<Schedule> savedSchedules = scheduleRepository.saveAll(newSchedules);

	    return new ResponseEntity<>(savedSchedules, HttpStatus.OK);
	}



	
}
