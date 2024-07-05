package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Participation;

public interface ParticipationRepository extends JpaRepository<Participation, Long>{
	public Participation findByMemberUsername(String username);
	
}
