package com.example.POPCornPickApi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CinemaRoomDto {
	private int total;
	private int bookedCnt;
	private Long roomNo;
	private Long cinemaNo;
	private Long roomTypeNo;
	private String smallType;
	private String cinemaName;
	
	

	
}
