package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieDetail {

	@Id
	private String movieDC;
	
	@Column(nullable = true)
	private String movieNm;
	
	@Column(nullable = true)
	private String movieNmEn;
	
	@Column(nullable = true)
	private String prdtYear;
	
	@Column(nullable = true)
	private String showTm;
	
	@Column(nullable = true)
	private String openDt;
	
	@Column(nullable = true)
	private String nations;
	
	@Column(nullable = true)
	private String genres;
	
	@Column(nullable = true)
	private String directors;
	
	@Column(nullable = true)
	private String actors;
	
	@Column(nullable = true)
	private String showTypes;
	
	@Column(nullable = true, length = 2000)
	private String description;
 
	
	
}
