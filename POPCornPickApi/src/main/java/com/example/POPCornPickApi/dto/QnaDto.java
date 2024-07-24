package com.example.POPCornPickApi.dto;

import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {

	private Long qnaNo;
	private String username;
	private String qnaTitle;
	private String qnaContent;
	private MultipartFile qnaFile;
	private String qnaBigCategory;
	private String qnaSmallCategory;
	private String qnaCinemaLocation;
	private String qnaCinemaName;
	private String qnaType;
	private String qnaAnswer;
	
}
