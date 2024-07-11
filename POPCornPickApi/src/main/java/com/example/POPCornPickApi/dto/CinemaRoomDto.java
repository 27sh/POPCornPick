package com.example.POPCornPickApi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CinemaRoomDto {
	private Long roomNo;
	private Long cinemaNo;
	private String roomTypeNo;
	private int total;
	private int bookedCnt;
	
	

	
}
