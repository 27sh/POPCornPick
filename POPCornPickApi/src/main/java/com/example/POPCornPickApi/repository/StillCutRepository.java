package com.example.POPCornPickApi.repository;

import java.util.List;

import org.aspectj.apache.bcel.util.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.MovieDetail;
import com.example.POPCornPickApi.entity.StillCut;

public interface StillCutRepository extends JpaRepository<StillCut, Long>{
	
	public List<StillCut> findByMovie(MovieDetail movieDC);
	
}
