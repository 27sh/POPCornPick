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

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Room extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long roomNo;
	
	@ManyToOne
	@JoinColumn(name = "cinemaNo", referencedColumnName = "cinemaNo", nullable = false)
	private Cinema cinema;
	
	@ManyToOne
	@JoinColumn(name = "roomTypeNo", referencedColumnName = "roomTypeNo", nullable = false)
	private RoomType roomType;
	
	@Column(nullable = false)
	private int roomRow;
	
	@Column(nullable = false)
	private int roomColumn;
	
	@Column(nullable = false)
	private String seatState;
	
}
