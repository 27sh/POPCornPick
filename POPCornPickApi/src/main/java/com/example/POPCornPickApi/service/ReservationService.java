package com.example.POPCornPickApi.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.ReservationFinalPayDto;
import com.example.POPCornPickApi.dto.ScheduleDto_JYC;
import com.example.POPCornPickApi.entity.Card;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Coupon;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.GiftCard;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Point;
import com.example.POPCornPickApi.entity.ReservatedSeat;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.Schedule;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.repository.CardRepository;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.CouponRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.GiftCardRepository;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.MovieShowDetailRepository;
import com.example.POPCornPickApi.repository.PointRepository;
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
	private ScheduleRepository scheduleRepository;
	private SeatRepository seatRepository;
	private ReservatedSeatRepository reservatedSeatRepository;
	private GiftCardRepository giftCardRepository;
	private CouponRepository couponRepository;
	private PointRepository pointRepository;
	private CardRepository cardRepository;
	private MemberRepository memberRepository;
	
	
	public ReservationService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository,
			RoomRepository roomRepository, MovieRepository movieRepository,
			MovieShowDetailRepository movieShowDetailRepository, TicketingRepository ticketingRepository,
			ScheduleRepository scheduleRepository, SeatRepository seatRepository, ReservatedSeatRepository reservatedSeatRepository,
			GiftCardRepository giftCardRepository, CouponRepository couponRepository, PointRepository pointRepository, 
			CardRepository cardRepository, MemberRepository memberRepository
			) {
		this.cinemaRepository = cinemaRepository;
		this.expCinemaRepository = expCinemaRepository;
		this.roomRepository = roomRepository;
		this.movieRepository = movieRepository;
		this.movieShowDetailRepository = movieShowDetailRepository;
		this.ticketingRepository = ticketingRepository;
		this.scheduleRepository = scheduleRepository;
		this.seatRepository = seatRepository;
		this.reservatedSeatRepository = reservatedSeatRepository;
		this.giftCardRepository = giftCardRepository;
		this.couponRepository = couponRepository;
		this.pointRepository = pointRepository;
		this.cardRepository = cardRepository;
		this.memberRepository = memberRepository;
	}

	public List<Cinema> getCinemaByLocaiton(String cinemaLocation) {

		String location = "";
		
		if(cinemaLocation.equals("seoul")) {
			location = "서울";
		}else if(cinemaLocation.equals("gyeonggi_incheon")){
			location = "경기/인천";
		}else if(cinemaLocation.equals("chungcheong_daejeon")){
			location = "충청/대전";
		}else if(cinemaLocation.equals("jeonla_gwangju")){
			location = "전라/광주";
		}else if(cinemaLocation.equals("gyeongnam_busan_ulsan")){
			location = "경남/부산/울산";
		}else if(cinemaLocation.equals("gangwon")){
			location = "강원";
		}else if(cinemaLocation.equals("jeju")){
			location = "제주";
		}else if(cinemaLocation.equals("gyeongbuk_daegu")) {
			location = "경북/대구";
		}
		
		List<Cinema> cinemaList = cinemaRepository.findByCinemaLocationOrderByCinemaNameAsc(location);
		return cinemaList;
	}

	public Map<String, String> getCountPerLocation(String username) {

		Map<String, String> countMap = new LinkedHashMap<>();
		
		int countMyCinema = expCinemaRepository.countByMember_Username(username);
		int countSeoul = cinemaRepository.countByCinemaLocation("서울");
		int countGyeonggi_incheon = cinemaRepository.countByCinemaLocation("경기/인천");
		int countChungcheong_daejeon = cinemaRepository.countByCinemaLocation("충청/대전");
		int countJeonla_gwangju = cinemaRepository.countByCinemaLocation("전라/광주");
		int countGyeongbuk_daegu = cinemaRepository.countByCinemaLocation("경북/대구");
		int countGyeongnam_busan_ulsan = cinemaRepository.countByCinemaLocation("경남/부산/울산");
		int countGangwon = cinemaRepository.countByCinemaLocation("강원");
		int countJeju = cinemaRepository.countByCinemaLocation("제주");
		
		countMap.put("myCinema", "My 영화관(" + countMyCinema + ")");
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

		Map<String, String> countMap = new LinkedHashMap<>();
		
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
	
	public List<ExpCinema> getMyCinemaList(String username){
		
		List<ExpCinema> expCinemaList = expCinemaRepository.findByMemberUsernameOrderByCinema_CinemaNameAsc(username);
		
		return expCinemaList;
	}

	public List<Movie> getMovieList() {

		List<MovieShowDetail> movieShowDetailList = movieShowDetailRepository.findAll();
		Map<Long, Long> countMap = new HashMap<>();
		movieShowDetailList.forEach(movieShowDetail -> {
			Long count = ticketingRepository.getTicketingCountByDetailNo(movieShowDetail.getDetailNo());
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
			List<Schedule> scheduleList = scheduleRepository.findByMovieShowDetail_DetailNoOrderByStartAsc(detailNo);
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
		Schedule schedule = scheduleRepository.findByScheduleNo(scheduleNo);
		ScheduleDto_JYC scheduleDto = new ScheduleDto_JYC();
		scheduleDto.setScheduleNo(schedule.getScheduleNo());
		scheduleDto.setMovieShowDetail(schedule.getMovieShowDetail());
		scheduleDto.setEnd(schedule.getEnd());
		scheduleDto.setStart(schedule.getStart());
		scheduleDto.setRoom(schedule.getRoom());
		int totalSeats = schedule.getRoom().getRoomType().getRoomTotalColumn() * schedule.getRoom().getRoomType().getRoomTotalRow();
		int bookedSeats = reservatedSeatRepository.getCountByScheduleNo(schedule.getScheduleNo());
		List<ReservatedSeat> reservatedSeatList = reservatedSeatRepository.getReservatedSeatByScheduleNo(scheduleNo);
		int leftSeats = totalSeats - bookedSeats;
		
		scheduleDto.setReservatedSeatList(reservatedSeatList);
		
		scheduleDto.setTotalSeat(totalSeats);
		scheduleDto.setBookedSeat(bookedSeats);
		scheduleDto.setLeftSeat(leftSeats);
		
		return scheduleDto;
	}
	
	public List<GiftCard> getMyValidGiftCard(String username){
		
		LocalDate today = LocalDate.now();
		List<GiftCard> giftCardList = giftCardRepository.findByMember_UsernameAndProduct_ProductTypeAndProduct_ProductEndDateAfterOrderByProduct_ProductEndDateAsc(username, "영화관람권" ,today);
		System.out.println(giftCardList.size());
		System.out.println(giftCardList);
		return giftCardList;
	}

	public List<Coupon> getMyValidDiscountCoupon(String username){
		
		LocalDate today = LocalDate.now();
		
		List<Coupon> couponList = couponRepository.findByMember_UsernameAndCouponNo_EndDateAfterAndModdateIsNullOrderByCouponNo_EndDateAsc(username, today);
		
		return couponList;
	}
	
	public int getMyPoint(String username) {
		
		int totalAcheivePoint = pointRepository.getTotalAcheiveByUsername(username);
		
		int totalPointUsePoint = pointRepository.getTotalPointUserByUsername(username);
		
		int resultPoint = totalAcheivePoint -  totalPointUsePoint;
		
		return resultPoint;
	}
	
	public String getPayResult(ReservationFinalPayDto reservationFinalPay, String username) {
		
		List<String> classNames = reservationFinalPay.getClassNames(); // 할인 쿠폰 번호
		Long scheduleNo = Long.parseLong(reservationFinalPay.getScheduleNo()); // 상영 스케줄 번호
		String[] seatSelected = reservationFinalPay.getSeatSelected().split(", "); // 선택된 좌석
		int payResult = reservationFinalPay.getPayResult(); // 총 결제 금액
		String cardName = reservationFinalPay.getCardName(); // 카드 이름
		int inputPoint = reservationFinalPay.getInputPoint(); // 사용된 포인트 
		
		// 카드에 잔액이 있는지 확인하는 기능
		Card card = cardRepository.findByMember_UsernameAndCardCompanyAndCardEndDateAfterAndMoneyGreaterThan(username, cardName, new Date(), payResult);
		
		if(card != null) {
			if(card.getMoney() < payResult) {
				return "잔액이 부족합니다.";
			}else {
				Card newCard = new Card(card.getCardNo(), card.getMember(), card.getCardCompany(), card.getCardEndDate(), card.getMoney() - payResult);
				cardRepository.save(newCard);
			}
		}else {
			return "사용할 수 없는 카드입니다.";
		}
		
		for(int i = 0; i < seatSelected.length; i ++) { // reservatedSeat 좌석 예약 기능
			int asciiValue = (int)seatSelected[i].charAt(0);
			int seatRow = asciiValue - 64;
			int seatColumn = Integer.parseInt(seatSelected[i].substring(1, seatSelected[i].length()));
			Optional<ReservatedSeat> reservatedSeat = reservatedSeatRepository.findBySchedule_ScheduleNoAndSeatRowAndSeatColumn(scheduleNo, seatRow, seatColumn);
			if(reservatedSeat.isPresent()) {
				return "이미 예약된 좌석입니다.";
			}else {
				Optional<Schedule> schedule = scheduleRepository.findById(scheduleNo);
				if(schedule.isPresent()) {
					ReservatedSeat reservatedSeatEntity = new ReservatedSeat(null, schedule.get(), seatRow, seatColumn, true);
					reservatedSeatRepository.save(reservatedSeatEntity);
					Optional<ReservatedSeat> reservatedSeatFound = reservatedSeatRepository.findBySchedule_ScheduleNoAndSeatRowAndSeatColumn(scheduleNo, seatRow, seatColumn);
					if(reservatedSeatFound.isPresent()) {
						ReservatedSeat reservatedSeatEntityFound = reservatedSeatFound.get();
						Member member = memberRepository.findByUsername(username);
						Ticketing ticketing = new Ticketing(null, null, member, reservatedSeatEntityFound, payResult, false);
						ticketingRepository.save(ticketing);
					}
				}
			}
		}
		
		if(classNames.size() > 0) {
			// 할인 쿠폰이 적용 되어 있을 경우
			// 할인 쿠폰을 사용하지 못하게 테이블에 값을 바꿔줘야 한다.
			
			Long issueNo = Long.parseLong(classNames.get(0).substring(8, classNames.get(0).length()));
			Optional<Coupon> coupon = couponRepository.findById(issueNo);
			
			if(coupon.isPresent()) {
				Coupon couponEntity = coupon.get();
				couponEntity.setModdate(new Date());
				couponRepository.save(couponEntity);
			}else {
				return "쿠폰이 존재하지 않습니다.";
			}
			
		} else {
			System.out.println("아무것도 없습니다.");
		}
		
		if(inputPoint > 0) {
			Member member = memberRepository.findByUsername(username);
			Point point = new Point(null, member, "영화예매", 0, inputPoint);
			
			pointRepository.save(point);
		}
		return "예매가 성공적으로 처리되었습니다.";
	}
	
}