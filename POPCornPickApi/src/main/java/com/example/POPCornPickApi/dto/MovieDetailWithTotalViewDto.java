package com.example.POPCornPickApi.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieDetailWithTotalViewDto {

	private String movieDC;
	private String movieNm;
	private String movieNmEn;
	private String prdtYear;
	private String showTm;
	private String openDt;
	private String nations;
	private String genres;
	private String directors;
	private String actors;
	private String showTypes;
	private String description;
	private String viewAge;
	private String imgUrl;
	private Long totalView;
	
}
