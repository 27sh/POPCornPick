package com.example.POPCornPickApi.entity;

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
public class ExpCinema {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long expCineNo;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "cinemaNo", referencedColumnName = "cinemaNo", nullable = false)
	private Cinema cinema;
}
