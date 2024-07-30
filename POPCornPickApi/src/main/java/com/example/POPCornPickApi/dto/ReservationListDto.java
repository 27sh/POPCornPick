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
	private String promotionPoster;
	private String movieNm;
	private String cinemaName;
	private Date start;
	private int seatRow;
	private int seatColumn;
	private int payTotalAmount;
	
}
