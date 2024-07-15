package com.example.POPCornPickApi.dto;

import java.util.Date;

import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;

import lombok.Data;

@Data
public class ScheduleDto {
	private Long scheduleNo;
	private Long roomNo;
	private Long detailNo; 
	private Date start;
	private Date end;
}
