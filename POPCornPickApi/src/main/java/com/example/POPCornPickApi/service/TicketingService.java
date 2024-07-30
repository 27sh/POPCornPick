package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.DailySalesDto;
import com.example.POPCornPickApi.dto.FmSaleDto;
import com.example.POPCornPickApi.dto.MonthlySalesDto;
import com.example.POPCornPickApi.dto.MovieSaleDto;
import com.example.POPCornPickApi.dto.YearSalesDto;
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
	
	public List<DailySalesDto> getDailySalesData(int year){
		
		List<DailySalesDto> amountList = ticketingRepository.getDailySales(year);
		
		return amountList;
	}
	
	public List<MonthlySalesDto> getMonthlySalesData(int year){
		
		List<MonthlySalesDto> amountList = ticketingRepository.getMonthlySales(year);
		
		return amountList;
	}

	public List<YearSalesDto> getYearSalesData(){
		
		List<YearSalesDto> amountList = ticketingRepository.getYearSales();
		
		return amountList;
	}
	
	public List<MovieSaleDto> getMoviesSalesData(){
		
		List<MovieSaleDto> amountList = ticketingRepository.getMoviesSales();
		
		System.out.println("amountList : " + amountList);
		
		return amountList;
	}
	
	public List<FmSaleDto> getFmSalesData(){
		
		List<FmSaleDto> amountList = ticketingRepository.getFmSales();
	
		return amountList;
	}
	
	
}
