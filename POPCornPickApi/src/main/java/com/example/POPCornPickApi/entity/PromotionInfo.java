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
public class PromotionInfo extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long promotionNo;
	
	@OneToOne
	@JoinColumn(name = "movieDc", referencedColumnName = "movieDc", nullable = false)
	private Movie movie;
	
	@Column(nullable = false)
	private String promotionIntro;
	
	@Column(nullable = false)
	private String promotionStealcut;
	
	@Column(nullable = false)
	private String promotionTrailer;
	
	@Column(nullable = false)
	private String promotionPoster;
	

}
