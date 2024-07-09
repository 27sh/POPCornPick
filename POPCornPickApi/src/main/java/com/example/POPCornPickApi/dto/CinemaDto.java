package com.example.POPCornPickApi.dto;

import org.springframework.web.multipart.MultipartFile;

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
	
	public String getFileNema() {
		return cinemaImg.getOriginalFilename();
	}
}
