package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Review extends BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reviewNo;
	
	@OneToOne
	@JoinColumn(name = "ticketingNo", referencedColumnName = "ticketingNo", nullable = false)
	private Ticketing ticketing;
	
	@Column(nullable = false)
	private String reviewContent;
	
	@Column(nullable = false)
	private int reviewScore;
	
	@Column(nullable = true)
	private int reviewState;
	
	@Column(nullable = false)
	private boolean spoiler;
}
