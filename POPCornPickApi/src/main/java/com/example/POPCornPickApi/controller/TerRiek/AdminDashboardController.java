package com.example.POPCornPickApi.controller.TerRiek;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.DailySalesDto;
import com.example.POPCornPickApi.dto.FmSaleDto;
import com.example.POPCornPickApi.dto.MonthlySalesDto;
import com.example.POPCornPickApi.dto.MovieSaleDto;
import com.example.POPCornPickApi.dto.YearSalesDto;
import com.example.POPCornPickApi.service.TicketingService;

@RestController
@RequestMapping("/api/v1/admin/dashboard")
public class AdminDashboardController {

	private TicketingService ticketingService;
	
	public AdminDashboardController(TicketingService ticketingService) {
		this.ticketingService = ticketingService;
	}
	
	@GetMapping("/sales/daily")
	public ResponseEntity<List<DailySalesDto>> getDailySalesData(){
		
		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		
		int year = calendar.get(Calendar.YEAR);
		
		List<DailySalesDto> dailySalesList = ticketingService.getDailySalesData(year);
			
		if(dailySalesList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(dailySalesList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/sales/monthly")
	public ResponseEntity<List<MonthlySalesDto>> getMonthlySalesData(){
		
		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		
		int year = calendar.get(Calendar.YEAR);
		
		List<MonthlySalesDto> monthlySalesList = ticketingService.getMonthlySalesData(year);
			
		if(monthlySalesList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(monthlySalesList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/sales/year")
	public ResponseEntity<List<YearSalesDto>> getYearSalesData(){
		
		List<YearSalesDto> yearSalesList = ticketingService.getYearSalesData();
			
		if(yearSalesList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(yearSalesList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/sales/movie")
	public ResponseEntity<List<MovieSaleDto>> getMoviesSalesData(){
		
		List<MovieSaleDto> moviesSalesList = ticketingService.getMoviesSalesData();
			
		if(moviesSalesList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(moviesSalesList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
	
	@GetMapping("/sales/fm")
	public ResponseEntity<List<FmSaleDto>> getFmSalesData(){
		
		List<FmSaleDto> fmSalesList = ticketingService.getFmSalesData();
			
		if(fmSalesList != null) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(fmSalesList);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(null);
	}
}
