package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Expectation;

public interface ExpectationRepository extends JpaRepository<Expectation, Long>{
	
	List<Expectation> findByExpNo(Expectation expNo);
	
	boolean existsByExpNo(Expectation expNo);
}
