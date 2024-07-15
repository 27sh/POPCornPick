package com.example.POPCornPickApi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor

public class NoticeListDto {
	
	private Long noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private MultipartFile noticeFile;
	private String noticeCategory;
	
	public String getFileNema() {
		return noticeFile.getOriginalFilename();
	}
	
	public MultipartFile getImgfile() {
		return noticeFile;
	}
}
