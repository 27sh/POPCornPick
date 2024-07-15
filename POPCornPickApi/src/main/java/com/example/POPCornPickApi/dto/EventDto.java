package com.example.POPCornPickApi.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDto {
	private Long eventNo;
	private String eventTitle;
	private String eventContent;
	private Date startEvent;
	private Date endEvent;
	private MultipartFile eventFile;
	
	public String getFileName() {
		return eventFile.getOriginalFilename();
	}
	
	public MultipartFile getImgFile() {
		return eventFile;
	}
}
