package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Cinema extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cinemaNo;
	
	@Column(nullable = false)
	private String cinemaImgOriginName;
	
	@Column(nullable = false)
	private String cinemaImgNewName;
	
	@Column(nullable = true)
	private String cinemaIntro;
	
	@Column(nullable = false)
	private String cinemaLocation;
	
	@Column(nullable = false)
	private String cinemaAddr;
	
	@Column(nullable = false)
	private String cinemaTel;
	
	@Column(nullable = false)
	private String cinemaName;
	
}
