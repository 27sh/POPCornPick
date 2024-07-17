package com.example.POPCornPickApi.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NonMemberLoginDto {
	
	private String name;
	private String tel;
	private String birthdate;
	private String password2;
	
	
}
