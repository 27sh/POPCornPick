package com.example.POPCornPickApi.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReservationListDto {
	
	private Long ticketingNo;
	private Date regdate;
	private String movieNm;
	private String cinemaName;
	private String start;
	private int seatRow;
	private int seatColumn;
	private int payTotalAmount;
	
}
