package com.example.POPCornPickApi.dto;

import java.util.Date;

import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;

import lombok.Data;

@Data
public class ScheduleDto {
	private String title;
	private String roomNo;
	private String detailNo; 
	private Date start;
	private Date end;
}
