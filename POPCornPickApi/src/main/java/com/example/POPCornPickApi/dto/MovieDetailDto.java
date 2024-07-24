package com.example.POPCornPickApi.dto;

import java.util.List;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.StillCut;
import com.example.POPCornPickApi.entity.Utube;

import lombok.Data;

@Data
public class MovieDetailDto {
	
	
	private List<Utube> utube;
	private List<StillCut> stillcut;
	
}
