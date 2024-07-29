package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class TicketingService {
	
	@Autowired
    private TicketingRepository ticketingRepository;
	
	@Autowired
	private MovieDetailRepository mdr;
	@Autowired
	private MovieRepository mr;
	
	public List<String> getTopMoviesByTicketCount() {
        List<Object[]> result = ticketingRepository.getTopMoviesByTicketCount();
        return result.stream()
                .map(record -> (String) record[0])
                .collect(Collectors.toList());
    }
	
	public List<Ticketing> getticketno(String username,String movieDC){
		System.out.println(username);
		MovieDetail moviedetail = mdr.findMovieNmByMovieDC(movieDC);
		System.out.println("얘가나오는지" + moviedetail);
		Long movieDCresult = mr.findMovieDCByTitle(moviedetail.getMovieNm());
		System.out.println("무비결과가 나오는지" + movieDCresult);
		List<Ticketing> findmvdc = ticketingRepository.findByMember_UsernameAndViewTFAndReservatedSeat_Schedule_MovieShowDetail_Movie_MovieDC(username, true, movieDCresult);
		System.out.println("리스트가 나오는지--- " + findmvdc);
		return findmvdc;
		
	}
	
	
}
