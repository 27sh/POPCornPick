package com.example.POPCornPickApi.dto;

import java.util.Date;

import com.example.POPCornPickApi.entity.MovieShowDetail;

import lombok.Data;

@Data
public class ScheduleDto {
	private Long scheduleNo;
	private MovieShowDetail movieShowDetail; 
	private String color;
	private Date start;
	private Date end;
}
