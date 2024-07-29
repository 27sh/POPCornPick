package com.example.POPCornPickApi.controller.bscomeber1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.MovieDetailDto;
import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Review;
import com.example.POPCornPickApi.entity.StillCut;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.entity.Utube;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.repository.ReviewRepository;
import com.example.POPCornPickApi.repository.StillCutRepository;
import com.example.POPCornPickApi.repository.UtubeRepository;
import com.example.POPCornPickApi.service.MovieDetailService;
import com.example.POPCornPickApi.service.TicketingService;
import com.example.POPCornPickApi.service.UtubeService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/v1/film")
public class FilmController {

	@Autowired
	private MovieDetailService movieDetailService;
	
	@Autowired
	private UtubeService utubeservice;
	
	@Autowired
	private UtubeRepository utuberepository;
	
	@Autowired
	private StillCutRepository stillcutrepository;
	
	@Autowired
	private ReviewRepository reviewrepository;

	@Autowired
	private JWTUtil jwtutil;
	
	@Autowired
	private TicketingService tkser;
	
	@PostMapping("/saveMovieList")
	public String postmovieList() {

		return "";
	}

	@GetMapping("/MovieList")
	public List<MovieDetail> movieList() {

//		System.out.println("무비리스트 화면인데 안나와서 시스아웃찍어보는중");
//		
//		System.out.println("뭐잘못한거지" + movieDetailService.getAllMovieDetails());
		
		return movieDetailService.getAllMovieDetails();
	}

//	@GetMapping("/movieDetail/{movieDC}")
//	public ResponseEntity<MovieDetail> movieDetail(@PathVariable("movieDC") String movieDC) {
//
//		MovieDetail moviedetail = movieDetailService.getMovieDetail(movieDC);
//
//		return ResponseEntity.status(HttpStatus.OK).body(moviedetail);
//	}
//	
	@GetMapping("/movieDetail/{movieDC}")
	public ResponseEntity<MovieDetailDto> showutube(@PathVariable("movieDC") String movieDC){
		
		
		MovieDetailDto mdd = new MovieDetailDto();
				
		MovieDetail mvd = new MovieDetail();
		mvd.setMovieDC(movieDC);
		List<Utube> utube = utuberepository.findByMovie(mvd);
		mdd.setUtube(utube);
		
		List<StillCut> sc = stillcutrepository.findByMovie(mvd);
		mdd.setStillcut(sc);
		
		return ResponseEntity.status(HttpStatus.OK).body(mdd);
	}
	@PostMapping("/ScoreInput/{movieDC}")
	public ResponseEntity<String> scoreForm(@RequestBody Review review, HttpServletRequest request, @PathVariable("movieDC") String movieDC) {
		
		String jwtToken = request.getHeader("Authorization").split(" ")[1];
		
		System.out.println("제이더블류티토큰" + jwtToken);
		
		String uesrname = jwtutil.getUsername(jwtToken);
	
		List<Ticketing> ticketing = tkser.getticketno(uesrname,movieDC);
			
		Review score = new Review();
		System.out.println(review.getReviewScore());
		System.out.println("얘가 문젠거같은데" + ticketing.get(0));
		
		if(ticketing == null) {
			
			return ResponseEntity.status(HttpStatus.OK).body("영화를 관람하지 않았습니다.");
		}else {
			
			score.setReviewContent(review.getReviewContent());
			score.setReviewScore(review.getReviewScore());
			score.setTicketing(ticketing.get(0));
			
			reviewrepository.save(score);
			return ResponseEntity.status(HttpStatus.OK).body("평점을 등록하였습니다.");
		}	

	
		
	}
	
	
}
