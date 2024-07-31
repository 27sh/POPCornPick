package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Participation;

public interface ParticipationRepository extends JpaRepository<Participation, Long>{
	public Participation findByMemberUsername(String username);
	
	@Query("select count(p) from Participation p where p.event.eventNo = :eventNo and p.member.username = :username")
	public int countByEventEventNoAndMemberUsername(@Param("eventNo")Long eventNo, @Param("username")String username);
	
	public List<Participation> findByMember(Member memberUsername);
}
