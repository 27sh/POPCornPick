package com.example.POPCornPickApi.dto;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberDto {
	private String username;
	private String name;
	private String formattedJoinDate;
	private int warnAmount;
	private String memberState;
	
	public MemberDto(String username, String name, Date joinDate, int warnAmount, String memberState) {
		super();
		this.username = username;
		this.name = name;
		this.formattedJoinDate = formatJoinDate(joinDate);
		this.warnAmount = warnAmount;
		this.memberState = memberStateValue(memberState);
	}
	
	private String formatJoinDate(Date joinDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(joinDate);
	}
	
	private String memberStateValue(String memberState) {
		if(memberState == null) {
			return "활동중";
		} else {
			return memberState;
		}
	}
	
	
	
	
}
