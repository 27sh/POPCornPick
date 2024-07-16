package com.example.POPCornPickApi.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
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

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.ScheduleDto;
import com.example.POPCornPickApi.dto.ScheduleDto_JYC;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.Schedule;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.MovieShowDetailRepository;
import com.example.POPCornPickApi.repository.ReservatedSeatRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.ScheduleRepository;
import com.example.POPCornPickApi.repository.SeatRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class ReservationService {
	private CinemaRepository cinemaRepository;
	private ExpCinemaRepository expCinemaRepository;
	private RoomRepository roomRepository;
	private MovieRepository movieRepository;
	private MovieShowDetailRepository movieShowDetailRepository;
	private TicketingRepository ticketingRepository;
	private ScheduleRepository shceduleRepository;
	private SeatRepository seatRepository;
	private ReservatedSeatRepository reservatedSeatRepository;

	public ReservationService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository,
			RoomRepository roomRepository, MovieRepository movieRepository,
			MovieShowDetailRepository movieShowDetailRepository, TicketingRepository ticketingRepository,
			ScheduleRepository shceduleRepository, SeatRepository seatRepository, ReservatedSeatRepository reservatedSeatRepository) {
		this.cinemaRepository = cinemaRepository;
		this.expCinemaRepository = expCinemaRepository;
		this.roomRepository = roomRepository;
		this.movieRepository = movieRepository;
		this.movieShowDetailRepository = movieShowDetailRepository;
		this.ticketingRepository = ticketingRepository;
		this.shceduleRepository = shceduleRepository;
		this.seatRepository = seatRepository;
		this.reservatedSeatRepository = reservatedSeatRepository;
	}

	public List<Cinema> getCinemaByLocaiton(String cinemaLocation) {

		List<Cinema> cinemaList = cinemaRepository.findByCinemaLocationOrderByCinemaNameAsc(cinemaLocation);

		
		return cinemaList;
	}

	public Map<String, String> getCountPerLocation() {

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
		countMap.put("seoul", "서울(" + countSeoul + ")");
		countMap.put("gyeonggi_incheon", "경기/인천(" + countGyeonggi_incheon + ")");
		countMap.put("chungcheong_daejeon", "충청/대전(" + countChungcheong_daejeon + ")");
		countMap.put("jeonla_gwangju", "전라/광주(" + countJeonla_gwangju + ")");
		countMap.put("gyeongbuk_daegu", "경북/대구(" + countGyeongbuk_daegu + ")");
		countMap.put("gyeongnam_busan_ulsan", "경남/부산/울산(" + countGyeongnam_busan_ulsan + ")");
		countMap.put("gangwon", "강원(" + countGangwon + ")");
		countMap.put("jeju", "제주(" + countJeju + ")");

		
		return countMap;
	}

	public Map<String, String> getCountPerSpecial() {

		Map<String, String> countMap = new HashMap<>();

		
		int count4DX = roomRepository.getCountByRoomTypeNo(4L);
		int countIMAX = roomRepository.getCountByRoomTypeNo(3L);
		int countPRIVATE_BOX = roomRepository.getCountByRoomTypeNo(5L);

		countMap.put("4DX", "4DX(" + count4DX + ")");
		countMap.put("IMAX", "IMAX(" + countIMAX + ")");
		countMap.put("PRIVATE_BOX", "PRIVATE BOX(" + countPRIVATE_BOX + ")");

		return countMap;
	}

	public List<Room> getCinemaByRoomTypeNo(Long roomTypeNo) {

		List<Room> roomList = roomRepository.findByRoomType_RoomTypeNoOrderByCinema_CinemaNameAsc(roomTypeNo);

		
		return roomList;
	}

	public List<Movie> getMovieList() {

		List<MovieShowDetail> movieShowDetailList = movieShowDetailRepository.findAll();
		Map<Long, Long> countMap = new HashMap<>();
		movieShowDetailList.forEach(movieShowDetail -> {
			Long count = ticketingRepository.countByMovieShowDetail_DetailNo(movieShowDetail.getDetailNo());
			if(count > 0) {
				countMap.put(movieShowDetail.getDetailNo(), count);
			}
		});

		
		Set<Long> detailNoSet = new HashSet<>();

		for (int i = 0; i < countMap.size(); i++) {
			detailNoSet = countMap.keySet();
		}

		
		Map<Movie, Long> totalCountMap = new HashMap<>();

		
		detailNoSet.forEach(detailNo -> {
			MovieShowDetail movieShowDetail = movieShowDetailRepository.findByDetailNo(detailNo);
			Movie movie = movieRepository.findByMovieDC(movieShowDetail.getMovie().getMovieDC());
			if (totalCountMap.containsKey(movie)) {
				Long count = totalCountMap.get(movie);
				Long newCount = countMap.get(detailNo) + count;
				totalCountMap.remove(movie);
				totalCountMap.put(movie, newCount);
			} else {
				totalCountMap.put(movie, countMap.get(detailNo));
			}
		});

		
		Map<Movie, Long> map = sortByValue(totalCountMap);

		Set<Movie> movieSet = map.keySet();
		Set<Movie> movies = new HashSet<>();
		movies.addAll(movieSet);

		
		List<Movie> movieList = movieRepository.findAllByOrderByTitleAsc();
		List<Movie> result = new ArrayList<>();
		result.addAll(movies);

		
		Collections.reverse(result);

		
		movieList.forEach(movie -> {
			if (result.contains(movie)) {
				
			} else {
				result.add(movie);
			}
		});

		return result;
	}

	public List<Movie> getAboutToMovieList() {

		List<Movie> movieList = movieRepository.findAllByOrderByTitleAsc();

		
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

	public List<List<ScheduleDto_JYC>> getScheduleList(String cinemaName, String title, String date) {

		// 필요한 데이트 형식으로 만들어준다.
		String resultDate = getDate(date);

		// 영화관 기본키를 가지고 온다
		Long cinemaNo = cinemaRepository.findByCinemaName(cinemaName);

		// 영화관 기본키를 가지고 해당 영화관의 상영관을 가지고 온다.
		List<Room> roomList = roomRepository.findByCinema_CinemaNo(cinemaNo);

		// 영화 제목으로 영화 코드를 가지고 온다.
		Long movieDC = movieRepository.findMovieDCByTitle(title);

		List<Long> detailNoList = new ArrayList<>();

		// movieShowDetial 테이블에서 상영관과 영화가 일치하는 아이의 detailNo를 가지고 온다.
		roomList.forEach(room -> {
			detailNoList.add(movieShowDetailRepository.findDetailNoByMovieDCAndRoomNo(movieDC, room.getRoomNo()));
		});

		List<List<Schedule>> scheduleListList = new ArrayList<>();

		// 디테일 넘버로 상영시간 테이블에서 가지고 오는데 순서는 상영시작 시간 오름차순이다.
		detailNoList.forEach(detailNo -> {
			List<Schedule> scheduleList = shceduleRepository.findByMovieShowDetail_DetailNoOrderByStartAsc(detailNo);
			scheduleListList.add(scheduleList);
		});

		List<List<ScheduleDto_JYC>> resultScheduleListList = new ArrayList<>();

		scheduleListList.forEach(scheduleList -> {
			List<ScheduleDto_JYC> resultScheduleList = new ArrayList<>();
			scheduleList.forEach(schedule -> {
				if (date.split(" ")[4].length() == 1) {
					// 예약한 날짜가 오늘이 아닐 경우
					if (schedule.getStart().toString().split("-")[0].equals(resultDate.split("-")[0])
							&& schedule.getStart().toString().split("-")[1].equals(resultDate.split("-")[1])
							&& schedule.getStart().toString().split("-")[2].split(" ")[0]
									.equals(resultDate.split("-")[2].split(" ")[0])) {
						ScheduleDto_JYC scheduleDto = new ScheduleDto_JYC();
						scheduleDto.setScheduleNo(schedule.getScheduleNo());
						scheduleDto.setMovieShowDetail(schedule.getMovieShowDetail());
						scheduleDto.setEnd(schedule.getEnd());
						scheduleDto.setStart(schedule.getStart());
						scheduleDto.setRoom(schedule.getRoom());
						int totalSeats = schedule.getRoom().getRoomType().getRoomTotalColumn() * schedule.getRoom().getRoomType().getRoomTotalRow();
						int bookedSeats = reservatedSeatRepository.getCountByScheduleNo(schedule.getScheduleNo());
						int leftSeats = totalSeats - bookedSeats;
						
						System.out.println("totalSeats : " + totalSeats);
						System.out.println("bookedSeats : " + bookedSeats);
						System.out.println("leftSeats : " + leftSeats);
						
						scheduleDto.setTotalSeat(totalSeats);
						scheduleDto.setBookedSeat(bookedSeats);
						scheduleDto.setLeftSeat(leftSeats);
						resultScheduleList.add(scheduleDto);
					}

				} else {
					// 예약한 날짜가 오늘일 경우
					int scheduleHours = Integer.parseInt(schedule.getStart().toString().split(" ")[1].split(":")[0]);
					int scheduleMinutes = Integer.parseInt(schedule.getStart().toString().split(" ")[1].split(":")[1]);
					int myHours = Integer.parseInt(resultDate.split(" ")[1].split(":")[0]);
					int myMinutes = Integer.parseInt(resultDate.split(" ")[1].split(":")[1]);

					if (schedule.getStart().toString().split("-")[0].equals(resultDate.split("-")[0])
							&& schedule.getStart().toString().split("-")[1].equals(resultDate.split("-")[1])
							&& schedule.getStart().toString().split("-")[2].split(" ")[0]
									.equals(resultDate.split("-")[2].split(" ")[0])) {

						if (scheduleHours > myHours) {
							ScheduleDto_JYC scheduleDto = new ScheduleDto_JYC();
							scheduleDto.setScheduleNo(schedule.getScheduleNo());
							scheduleDto.setMovieShowDetail(schedule.getMovieShowDetail());
							scheduleDto.setEnd(schedule.getEnd());
							scheduleDto.setStart(schedule.getStart());
							scheduleDto.setRoom(schedule.getRoom());
							int totalSeats = schedule.getRoom().getRoomType().getRoomTotalColumn() * schedule.getRoom().getRoomType().getRoomTotalRow();
							int bookedSeats = reservatedSeatRepository.getCountByScheduleNo(schedule.getScheduleNo());
							int leftSeats = totalSeats - bookedSeats;
							
							System.out.println("totalSeats : " + totalSeats);
							System.out.println("bookedSeats : " + bookedSeats);
							System.out.println("leftSeats : " + leftSeats);
							
							scheduleDto.setTotalSeat(totalSeats);
							scheduleDto.setBookedSeat(bookedSeats);
							scheduleDto.setLeftSeat(leftSeats);
							resultScheduleList.add(scheduleDto);
							System.out.println(schedule.getStart());
						} else if (scheduleHours == myHours) {
							if (scheduleMinutes - 20 > myMinutes) {
								ScheduleDto_JYC scheduleDto = new ScheduleDto_JYC();
								scheduleDto.setScheduleNo(schedule.getScheduleNo());
								scheduleDto.setMovieShowDetail(schedule.getMovieShowDetail());
								scheduleDto.setEnd(schedule.getEnd());
								scheduleDto.setStart(schedule.getStart());
								scheduleDto.setRoom(schedule.getRoom());
								int totalSeats = schedule.getRoom().getRoomType().getRoomTotalColumn() * schedule.getRoom().getRoomType().getRoomTotalRow();
								int bookedSeats = reservatedSeatRepository.getCountByScheduleNo(schedule.getScheduleNo());
								int leftSeats = totalSeats - bookedSeats;
								
								System.out.println("totalSeats : " + totalSeats);
								System.out.println("bookedSeats : " + bookedSeats);
								System.out.println("leftSeats : " + leftSeats);
								
								scheduleDto.setTotalSeat(totalSeats);
								scheduleDto.setBookedSeat(bookedSeats);
								scheduleDto.setLeftSeat(leftSeats);
								resultScheduleList.add(scheduleDto);
							}
						}


					}
				}

			});
			resultScheduleListList.add(resultScheduleList);
		});

		System.out.println(resultScheduleListList);

		return resultScheduleListList;
	}

	public String getDate(String date) {
		if (date.split(" ")[4].length() == 1) {
			return date.split(" ")[0];
		} else {
			return date.split(" ")[0].replace("월", "") + " " + date.split(" ")[4];
		}
	}
	
	public int getSeatAmount(Long roomNo) {
		
		int leftSeats = seatRepository.getCinemaRoomBookedSeat(roomNo);
		
		if(leftSeats > 0) {
			return leftSeats;
		}
		
		return 0;
	}
	
	public ScheduleDto_JYC getScheduleDetail(Long scheduleNo) {
		
		Schedule schedule = shceduleRepository.findByScheduleNo(scheduleNo);
		ScheduleDto_JYC scheduleDto = new ScheduleDto_JYC();
		scheduleDto.setScheduleNo(schedule.getScheduleNo());
		scheduleDto.setMovieShowDetail(schedule.getMovieShowDetail());
		scheduleDto.setEnd(schedule.getEnd());
		scheduleDto.setStart(schedule.getStart());
		scheduleDto.setRoom(schedule.getRoom());
		int totalSeats = schedule.getRoom().getRoomType().getRoomTotalColumn() * schedule.getRoom().getRoomType().getRoomTotalRow();
		int bookedSeats = reservatedSeatRepository.getCountByScheduleNo(schedule.getScheduleNo());
		int leftSeats = totalSeats - bookedSeats;
		
		System.out.println("totalSeats : " + totalSeats);
		System.out.println("bookedSeats : " + bookedSeats);
		System.out.println("leftSeats : " + leftSeats);
		
		scheduleDto.setTotalSeat(totalSeats);
		scheduleDto.setBookedSeat(bookedSeats);
		scheduleDto.setLeftSeat(leftSeats);
		
		return scheduleDto;
	}

}