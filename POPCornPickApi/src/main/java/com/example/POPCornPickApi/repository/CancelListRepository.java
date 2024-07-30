package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.CancerList;
import com.example.POPCornPickApi.entity.Ticketing;

public interface CancelListRepository extends JpaRepository<CancerList, Long>{
	
	public List<Long> findByTicketing(Ticketing ticketing);
	
	public boolean existsByTicketing(Ticketing ticketing);
}
