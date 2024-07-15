package com.example.POPCornPickApi.dto;

import java.util.Date;

import com.example.POPCornPickApi.entity.MovieShowDetail;
import com.example.POPCornPickApi.entity.Room;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ScheduleDto_JYC {
	
	private Long scheduleNo;
	private Room room;
	private MovieShowDetail movieShowDetail; 
	private Date start;
	private Date end;
	private int totalSeat;
	private int bookedSeat;
	private int leftSeat;
}
