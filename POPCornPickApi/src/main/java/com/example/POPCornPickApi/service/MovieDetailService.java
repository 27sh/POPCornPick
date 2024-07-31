package com.example.POPCornPickApi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.MovieDetailWithTotalViewDto;
import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.repository.MovieDetailRepository;
import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class MovieDetailService {

	@Autowired
	private MovieDetailRepository movieDetailRepository;
	
	@Autowired
	private TicketingRepository ticketingRepository;
		
	public MovieDetail getMovieDetail(String movieDC) {
		return movieDetailRepository.findByMovieDC(movieDC);
	}
	
	
	public List<MovieDetail> getAllMovieDetails() {
        return movieDetailRepository.findAll();
    }

	public List<MovieDetailWithTotalViewDto> getMovieListOn(){
		
		Date today = new Date();
		
		List<MovieDetail> movieDetailList = movieDetailRepository.findAll();
		
		System.out.println(today);

		List<MovieDetailWithTotalViewDto> resultMovieDetailList = new ArrayList<>();
		
		movieDetailList.forEach(movieDetail -> {
			String openDtStr = movieDetail.getOpenDt();
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
			
			 try {
				Date openDt = formatter.parse(openDtStr);
				
				
				if(openDt.before(today)) {
					
					List<Ticketing> ticketingList = ticketingRepository.findByReservatedSeat_Schedule_MovieShowDetail_Movie_Title(movieDetail.getMovieNm());
					MovieDetailWithTotalViewDto newMovieDetailDto = new MovieDetailWithTotalViewDto();
					
					newMovieDetailDto.setMovieDC(movieDetail.getMovieDC());
					newMovieDetailDto.setMovieNm(movieDetail.getMovieNm());
					newMovieDetailDto.setMovieNmEn(movieDetail.getMovieNmEn());
					newMovieDetailDto.setPrdtYear(movieDetail.getPrdtYear());
					newMovieDetailDto.setShowTm(movieDetail.getShowTm());
					newMovieDetailDto.setOpenDt(movieDetail.getOpenDt());
					newMovieDetailDto.setNations(movieDetail.getNations());
					newMovieDetailDto.setGenres(movieDetail.getGenres());
					newMovieDetailDto.setDirectors(movieDetail.getDirectors());
					newMovieDetailDto.setActors(movieDetail.getActors());
					newMovieDetailDto.setShowTypes(movieDetail.getShowTypes());
					newMovieDetailDto.setDescription(movieDetail.getDescription());
					newMovieDetailDto.setViewAge(movieDetail.getViewAge());
					newMovieDetailDto.setImgUrl(movieDetail.getImgUrl());
					newMovieDetailDto.setTotalView(Long.valueOf(ticketingList.size()));
					
					resultMovieDetailList.add(newMovieDetailDto);
				}
				
			 } catch (ParseException e) {
				e.printStackTrace();
			}
			 
		});
		
		return resultMovieDetailList;
	}
	
	public List<MovieDetailWithTotalViewDto> getMovieListAboutto(){
		
		Date today = new Date();
		
		List<MovieDetail> movieDetailList = movieDetailRepository.findAll();
		
		System.out.println(today);

		List<MovieDetailWithTotalViewDto> resultMovieDetailList = new ArrayList<>();
		
		movieDetailList.forEach(movieDetail -> {
			String openDtStr = movieDetail.getOpenDt();
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
			
			 try {
				Date openDt = formatter.parse(openDtStr);
				
				
				if(openDt.after(today)) {
					
					List<Ticketing> ticketingList = ticketingRepository.findByReservatedSeat_Schedule_MovieShowDetail_Movie_Title(movieDetail.getMovieNm());
					MovieDetailWithTotalViewDto newMovieDetailDto = new MovieDetailWithTotalViewDto();
					
					newMovieDetailDto.setMovieDC(movieDetail.getMovieDC());
					newMovieDetailDto.setMovieNm(movieDetail.getMovieNm());
					newMovieDetailDto.setMovieNmEn(movieDetail.getMovieNmEn());
					newMovieDetailDto.setPrdtYear(movieDetail.getPrdtYear());
					newMovieDetailDto.setShowTm(movieDetail.getShowTm());
					newMovieDetailDto.setOpenDt(movieDetail.getOpenDt());
					newMovieDetailDto.setNations(movieDetail.getNations());
					newMovieDetailDto.setGenres(movieDetail.getGenres());
					newMovieDetailDto.setDirectors(movieDetail.getDirectors());
					newMovieDetailDto.setActors(movieDetail.getActors());
					newMovieDetailDto.setShowTypes(movieDetail.getShowTypes());
					newMovieDetailDto.setDescription(movieDetail.getDescription());
					newMovieDetailDto.setViewAge(movieDetail.getViewAge());
					newMovieDetailDto.setImgUrl(movieDetail.getImgUrl());
					newMovieDetailDto.setTotalView(Long.valueOf(ticketingList.size()));
					
					resultMovieDetailList.add(newMovieDetailDto);
				}
				
			 } catch (ParseException e) {
				e.printStackTrace();
			}
			 
		});
		
		return resultMovieDetailList;
	}

	public List<MovieDetail> getSearchResult(String keyword){
		
		List<MovieDetail> movieDetailList = movieDetailRepository.findByMovieNmContaining(keyword);
		
		return movieDetailList;
	}
	

//    public List<MovieUtube> getMovieDetailWithUtube(String moviedc) {
//        
//    	return movieDetailRepository.findMovieDetailWithUtube(moviedc);
//    }
	
	
	
}
