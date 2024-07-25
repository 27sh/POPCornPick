package com.example.POPCornPickApi.controller.sh27;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.ReservatedSeat;
import com.example.POPCornPickApi.entity.Review;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.entity.RoomType;
import com.example.POPCornPickApi.entity.Schedule;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.MovieShowDetailRepository;
import com.example.POPCornPickApi.repository.ReservatedSeatRepository;
import com.example.POPCornPickApi.repository.ReviewRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.repository.RoomTypeRepository;
import com.example.POPCornPickApi.repository.ScheduleRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@RestController
@RequestMapping("/api/v1/sRoom")
public class sRoomController {

	@Autowired
    private RoomTypeRepository roomTypeRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private CinemaRepository cinemaRepository;
    
    @Autowired
    private MovieShowDetailRepository movieShowDetailRepository;
    
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private ReservatedSeatRepository reservatedSeatRepository;

    @Autowired
    private TicketingRepository ticketingRepository;

    @Autowired
    private ReviewRepository reviewRepository;


    @GetMapping("/findCinemaNames")
    public String findCinemaNames(@RequestParam(name = "smallType") String smallType) {
        List<RoomType> roomTypes = roomTypeRepository.findBySmallType(smallType);
        List<Long> roomTypeNos = roomTypes.stream().map(RoomType::getRoomTypeNo).collect(Collectors.toList());
        
        List<Room> rooms = roomRepository.findByRoomTypeRoomTypeNoIn(roomTypeNos);
        List<Long> cinemaNos = rooms.stream().map(room -> room.getCinema().getCinemaNo()).collect(Collectors.toList());
        
        List<Cinema> cinemas = cinemaRepository.findByCinemaNoIn(cinemaNos);
        return cinemas.stream().map(cinema -> "<td>" + cinema.getCinemaName() + "</td>").collect(Collectors.joining());
    }
    
    @GetMapping("/findMoviesByRoomType")
    public String findMoviesByRoomType(@RequestParam(name = "smallType") String smallType) {
        List<RoomType> roomTypes = roomTypeRepository.findBySmallType(smallType);
        List<Long> roomTypeNos = roomTypes.stream().map(RoomType::getRoomTypeNo).collect(Collectors.toList());

        List<Room> rooms = roomRepository.findByRoomTypeRoomTypeNoIn(roomTypeNos);
        List<Long> roomNos = rooms.stream().map(Room::getRoomNo).collect(Collectors.toList());

        List<MovieShowDetail> movieShowDetails = movieShowDetailRepository.findByRoomRoomNoIn(roomNos);
        List<Long> detailNos = movieShowDetails.stream().map(MovieShowDetail::getDetailNo).distinct().collect(Collectors.toList());

        List<Schedule> schedules = scheduleRepository.findByMovieShowDetailDetailNoIn(detailNos);
        List<Long> scheduleNos = schedules.stream().map(Schedule::getScheduleNo).collect(Collectors.toList());

        List<ReservatedSeat> reservatedSeats = reservatedSeatRepository.findByScheduleScheduleNoIn(scheduleNos);
        List<Long> reservatedSeatNos = reservatedSeats.stream().map(ReservatedSeat::getReservatedSeatNo).collect(Collectors.toList());

        List<Ticketing> ticketings = ticketingRepository.findByReservatedSeatReservatedSeatNoIn(reservatedSeatNos);
        List<Long> ticketingNos = ticketings.stream().map(Ticketing::getTicketingNo).collect(Collectors.toList());

        List<Review> reviews = reviewRepository.findByTicketingTicketingNoIn(ticketingNos);

        return movieShowDetails.stream()
                .limit(3)
                .map(detail -> {
                    Movie movie = detail.getMovie();
                    double averageScore = reviews.stream()
                            .filter(review -> review.getTicketing().getReservatedSeat().getSchedule().getMovieShowDetail().getDetailNo().equals(detail.getDetailNo()))
                            .mapToInt(Review::getReviewScore)
                            .average()
                            .orElse(0.0);
                    return "<div class='movie-item'>" +
                            "<div class='poster'>포스터</div>" +
                            "<div class='movie-info'>" +
                            "<p>" + movie.getTitle() + "</p>" +
                            "<p>평점 " + String.format("%.1f", averageScore) + "</p>" +
                            "<button>예매하기</button>" +
                            "</div>" +
                            "</div>";
                })
                .collect(Collectors.joining());
    }
    
}
