package com.example.POPCornPickApi.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieSaleDto {

	private String title;
	private Long totalAmount;
	private Long totalView;
	
}
