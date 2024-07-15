package com.example.POPCornPickApi.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Seat {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long seatNo;
	
    @JsonIgnore
	@ManyToOne
	@JoinColumn(name = "roomNo", referencedColumnName = "roomNo", nullable = false)
    @ToString.Exclude
	private Room room;
	
	@Column(nullable = false)
	private int seatRow;
	
	@Column(nullable = false)
	private int seatColumn;
	
//	@Override
//	public String toString() {
//		return "Seat [seatNo="+ seatNo +"]";
//	}
}
