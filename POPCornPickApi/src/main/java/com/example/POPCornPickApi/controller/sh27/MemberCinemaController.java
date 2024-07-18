package com.example.POPCornPickApi.controller.sh27;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Room;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.RoomRepository;
import com.example.POPCornPickApi.service.ExpCinemaService;

@RestController
@RequestMapping("/api/v1/memberCinema")
public class MemberCinemaController {
    
    @Autowired
    private CinemaRepository cinemaRepository;
    
    @Autowired
    private RoomRepository roomRepository;
    
    @Autowired
    private ExpCinemaRepository expCinemaRepository;
    
    @Autowired
    private ExpCinemaService expCinemaService;

    @GetMapping("/cinemaLocation/{location}")
    public List<Cinema> getCinemasByLocation(@PathVariable("location") String location) {
        return cinemaRepository.findByCinemaLocation(location);
    }
    
    @GetMapping("/cinemaRooms/{cinemaNo}")
    public List<Room> getRoomsByCinemaNo(@PathVariable("cinemaNo") Long cinemaNo) {
        return roomRepository.findByCinema_CinemaNo(cinemaNo);
    }
    
    @GetMapping("/cinemaRoomCount/{cinemaNo}")
    public Map<String, Integer> getRoomCountAndSeatSumByCinemaNo(@PathVariable("cinemaNo") Long cinemaNo) {
        int roomCount = roomRepository.countRoomsByCinemaNo(cinemaNo);
        int seatSum = roomRepository.sumSeatCountByCinemaNo(cinemaNo);
        
        Map<String, Integer> response = new HashMap<>();
        response.put("roomCount", roomCount);
        response.put("seatSum", seatSum);
        return response;
    }
    
    @GetMapping("/favoriteCinemas")
    public List<Cinema> getFavoriteCinemas() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        
        List<ExpCinema> expCinemas = expCinemaRepository.findByMember_Username(username);
        List<Long> cinemaNos = expCinemas.stream().map(expCinema -> expCinema.getCinema().getCinemaNo()).collect(Collectors.toList());
        
        return cinemaRepository.findAllById(cinemaNos);
    }
    
    //crud
    
    @PostMapping("/insertExpCinema")
    public ResponseEntity<?> insertExpCinema(@RequestBody Map<String, String> request) {
        String cinemaName = request.get("cinemaName");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        expCinemaService.insertExpCinema(username, cinemaName);
        
        return ResponseEntity.ok("Cinema added to favorites");
    }
    
    @PutMapping("/updateExpCinema")
    public ResponseEntity<?> updateExpCinema(@RequestBody Map<String, String> request) {
        String oldCinemaName = request.get("oldCinemaName");
        String newCinemaName = request.get("newCinemaName");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        expCinemaService.updateExpCinema(username, oldCinemaName, newCinemaName);
        
        return ResponseEntity.ok("Cinema updated in favorites");
    }
    
    @DeleteMapping("/deleteExpCinema")
    public ResponseEntity<?> deleteExpCinema(@RequestBody Map<String, String> request) {
        String cinemaName = request.get("cinemaName");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        
        expCinemaService.deleteExpCinema(username, cinemaName);
        
        return ResponseEntity.ok("Cinema removed from favorites");
    }

}
	