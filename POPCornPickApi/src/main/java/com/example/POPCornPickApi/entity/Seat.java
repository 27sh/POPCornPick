package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Seat {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long seatNo;
	
	@ManyToOne
	@JoinColumn(name = "roomNo", referencedColumnName = "roomNo", nullable = false)
	private Room room;
	
	@Column(nullable = false)
	private int seatRow;
	
	@Column(nullable = false)
	private int seatColumn;
	
	@Column(nullable = false)
	private boolean isBooked;
}
