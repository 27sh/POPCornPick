package com.example.POPCornPickApi.dto;

import java.util.Date;

import com.example.POPCornPickApi.entity.Movie;
import com.example.POPCornPickApi.entity.Room;

import lombok.Data;

@Data
public class MovieShowDetailDto {
	private Long detailNo;
	private Movie movie;
	private Room room;
	private int showState;
	private Date startDate;
	private Date endDate;
	private Long totalViewer;
	private boolean dubbing;
	private boolean subtitle;
}
