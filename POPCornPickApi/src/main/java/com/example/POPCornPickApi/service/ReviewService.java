package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.AverageDTO;
import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Review;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.repository.MovieRepository;
import com.example.POPCornPickApi.repository.ReviewRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class ReviewService {
	@Autowired
    private ReviewRepository reviewRepository; // ReviewRepository 추가
	
	@Autowired
	private TicketingRepository ticketRepository;
	
	@Autowired
	private MovieDetailRepository mdr;
	@Autowired
	private MovieRepository mr;
	
	public double getAverageReviewScore(String title) {
        List<Integer> scores = reviewRepository.getReviewScoresByMovieTitle(title);
        if (scores.isEmpty()) {
            return 0.0;
        }
        double sum = scores.stream().mapToInt(Integer::intValue).sum();
        return sum / scores.size();
    }
	
	public List<Review> getReviewsByUsername(String username) {
        return reviewRepository.findByTicketing_Member_Username(username);
    }
	
	//무비디테일 평점 
	public Double getAverageScore(String title) {
		
		return reviewRepository.findAverageScore(title);
	}
	public Long getTitalCount(String title) {
		return reviewRepository.findTotalCount(title);
	}
	
	//멤버정보 가져올려고 만든것
	public List<Ticketing> getgender(String username, String movieDC){
	
		MovieDetail moviedetail = mdr.findMovieNmByMovieDC(movieDC);
		
		Long movieDCresult = mr.findMovieDCByTitle(moviedetail.getMovieNm());
		
		List<Ticketing>findmvdc = ticketRepository.findByMember_UsernameAndViewTFAndReservatedSeat_Schedule_MovieShowDetail_Movie_MovieDC(username, true, movieDCresult);
		System.out.println(findmvdc);
		return findmvdc;
	}
	public AverageDTO makescore(String movieDC) {
		
		MovieDetail moviedetail = mdr.findMovieNmByMovieDC(movieDC);
		
		Double avgscore = reviewRepository.findAverageScore(moviedetail.getMovieNm());
		
		Long avgcount = reviewRepository.findTotalCount(moviedetail.getMovieNm());
		AverageDTO avgdto = new AverageDTO();
		
		avgdto.setAcgscore(avgscore);
		avgdto.setAvgcount(avgcount);
		
		return avgdto;
	}
	
}
