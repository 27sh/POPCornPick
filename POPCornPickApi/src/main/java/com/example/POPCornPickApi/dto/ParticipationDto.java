package com.example.POPCornPickApi.dto;

import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.entity.Event;
import com.example.POPCornPickApi.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ParticipationDto {
	private Long particNo;
	private Member member;
	private Event event;
	private MultipartFile participationState;
	private String participationResult;
	private String contentsResult;
	
	public String getFileName() {
		return participationState.getOriginalFilename();
	}
}
