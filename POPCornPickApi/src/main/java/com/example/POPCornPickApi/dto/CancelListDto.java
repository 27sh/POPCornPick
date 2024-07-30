package com.example.POPCornPickApi.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CancelListDto {
	
	private String movieTitle;
	private String cinemaName;
	private Date start;
	private Date regdate;
	private int payTotalAmount;
	
}
