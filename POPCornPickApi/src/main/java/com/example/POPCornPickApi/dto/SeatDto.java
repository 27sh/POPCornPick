package com.example.POPCornPickApi.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SeatDto {
	private Long seatNo;
	private Long roomNo;
	private int seatRow;
	private int seatColumn;
	private boolean isBooked;
	
	public SeatDto(Long seatNo, Long roomNo, int seatRow, int seatColumn, boolean isBooked) {
		super();
		this.seatNo = seatNo;
		this.roomNo = roomNo;
		this.seatRow = seatRow;
		this.seatColumn = seatColumn;
		this.isBooked = isBooked;
	}
	
	
	
}
