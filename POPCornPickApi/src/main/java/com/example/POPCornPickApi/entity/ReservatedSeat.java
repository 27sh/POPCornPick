package com.example.POPCornPickApi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class ReservatedSeat {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long reservatedSeatNo;

	@ManyToOne
	@JoinColumn(name = "scheduleNo", referencedColumnName = "scheduleNo", nullable = false)
	private Schedule schedule;
	
	private int seatRow;
	private int seatColumn;
	private boolean isBooked;
}


