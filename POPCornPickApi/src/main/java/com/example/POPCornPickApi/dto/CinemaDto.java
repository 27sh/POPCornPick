package com.example.POPCornPickApi.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.entity.Cinema;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CinemaDto {
	private Long cinemaNo;
	private MultipartFile cinemaImg;
	private String cinemaIntro;
	private String cinemaLocation;
	private String cinemaAddr;
	private String cinemaTel;
	private String cinemaName;
	private int locationCnt;
	private List<Cinema> cinemaList;
	private List<CinemaDto> locationCntList;
	
	public String getFileNema() {
		return cinemaImg.getOriginalFilename();
	}
	
	public MultipartFile getImgfile() {
		return cinemaImg;
	}

	public CinemaDto(List<Cinema> cinemaList, List<CinemaDto> locationCntList) {
		super();
		this.cinemaList = cinemaList;
		this.locationCntList = locationCntList;
	}
	
	
}
