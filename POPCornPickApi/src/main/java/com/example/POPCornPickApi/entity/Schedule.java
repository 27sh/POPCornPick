package com.example.POPCornPickApi.entity;

import java.util.Date;

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
public class Schedule {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long scheduleNo;
	
	@ManyToOne
	@JoinColumn(name = "detailNo", referencedColumnName = "detailNo", nullable = false)
	private MovieShowDetail movieShowDetail; 
	
	@Column(nullable = true)
	private String schColor;
	
	@Column(nullable = true)
	private Date schDate;
	
	@Column(nullable = true)
	private Date startTime;
}
