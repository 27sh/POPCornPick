package com.example.POPCornPickApi.dto;

import com.example.POPCornPickApi.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {

	private Long qnaNo;
	private Member member;
	private String qnaTitle;
	private String qnaContent;
	private String qnaFile;
	private String qnaBigCategory;
	private String qnaSmallCategory;
	private String qnaCinemaLocation;
	private Long qnaCinemaNo;
	private String qnaType;
	private String qnaAnswer;
	
}
