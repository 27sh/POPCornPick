package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class MovieList extends BaseEntity {
	
	@Id
	private String movieCd;
	
	@Column(nullable = false)
	private String movieNm;
	
	@Column(nullable = false)
	private String movieNmEn;
	
	@Column(nullable = false)
	private String prdtYear;
	
	@Column(nullable = false)
	private String openDt;
	
	@Column(nullable = false)
	private String typeNm;
	
	@Column(nullable = false)
	private String prdtStatNm;
	
	@Column(nullable = false)
	private String nationAlt;
	
	@Column(nullable = false)
	private String genreAlt;
	
	@Column(nullable = false)
	private String repNationNm;
	
	@Column(nullable = false)
	private String repGenreNm;
	
	@Column(nullable = false)
	private String directors;
	
	@Column(nullable = false)
	private String peopleNm;
	
	@Column(nullable = false)
	private String companys;
	
	@Column(nullable = false)
	private String companyCd;
	
	@Column(nullable = false)
	private String companyNm;
	

}
