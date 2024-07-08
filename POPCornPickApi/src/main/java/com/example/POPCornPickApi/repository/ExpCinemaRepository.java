package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.ExpCinema;

public interface ExpCinemaRepository extends JpaRepository<ExpCinema, Long>{
	
	List<ExpCinema> findByMemberUsername(String username);
}
