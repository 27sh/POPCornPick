package com.example.POPCornPickApi.dto;

import java.time.Year;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class YearSalesDto {

	private int year;
	private Long totalAmount;
}
