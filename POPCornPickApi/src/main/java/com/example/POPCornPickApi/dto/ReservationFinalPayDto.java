package com.example.POPCornPickApi.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReservationFinalPayDto {

	private String scheduleNo;
	private String seatSelected;
	private int payResult;
	private List<String> classNames;
	private String cardName;
	private int inputPoint;
}
