package com.example.POPCornPickApi.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberParticipationDto {
	
	private Long particNo;
	private String username;
	private Long eventNo;
	private String eventTitle;
	private Date startEvent;
	private Date endEvent;
	private String participationResult;
	
}
