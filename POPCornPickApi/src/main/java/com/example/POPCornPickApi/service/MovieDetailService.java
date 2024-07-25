package com.example.POPCornPickApi.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.repository.MovieDetailRepository;

@Service
public class MovieDetailService {

	@Autowired
	private MovieDetailRepository movieDetailRepository;
	
		
	public MovieDetail getMovieDetail(String movieDC) {
		return movieDetailRepository.findByMovieDC(movieDC);
	}
	
	
	public List<MovieDetail> getAllMovieDetails() {
        return movieDetailRepository.findAll();
    }

	public List<MovieDetail> getMovieListOn(){
		
		Date today = new Date();
		
		List<MovieDetail> movieDetailList = movieDetailRepository.findAll();
		
		System.out.println(today);

		List<MovieDetail> resultMovieDetailList = new ArrayList<>();
		
		movieDetailList.forEach(movieDetail -> {
			String openDtStr = movieDetail.getOpenDt();
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
			
			 try {
				Date openDt = formatter.parse(openDtStr);
				
				
				if(openDt.before(today)) {
					resultMovieDetailList.add(movieDetail);
				}
				
			 } catch (ParseException e) {
				e.printStackTrace();
			}
			 
		});
		
		return resultMovieDetailList;
	}
	
	public List<MovieDetail> getMovieListAboutto(){
		
		Date today = new Date();
		
		List<MovieDetail> movieDetailList = movieDetailRepository.findAll();
		
		System.out.println(today);

		List<MovieDetail> resultMovieDetailList = new ArrayList<>();
		
		movieDetailList.forEach(movieDetail -> {
			String openDtStr = movieDetail.getOpenDt();
			
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
			
			 try {
				Date openDt = formatter.parse(openDtStr);
				
				
				if(openDt.after(today)) {
					resultMovieDetailList.add(movieDetail);
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
