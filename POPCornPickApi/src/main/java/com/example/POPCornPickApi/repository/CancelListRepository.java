package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.CancelList;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Ticketing;
import com.example.POPCornPickApi.entity.UnknownMember;

public interface CancelListRepository extends JpaRepository<CancelList, Long>{
	
	public List<Long> findByTicketing(Ticketing ticketing);
	
	public boolean existsByTicketing(Ticketing ticketing);
	
	public List<CancelList> findByMember(Member member);
	
	public List<CancelList> findByUnknownMember(UnknownMember unknownMember);
}
