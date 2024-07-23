package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.POPCornPickApi.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
    public Member findByUsername(Member username);
    public Member findByUsername(String username);
    
    public boolean existsByUsername(String username);
    
    @Query(value = "select * from member where role = 'ROLE_MEMBER'", nativeQuery = true)
    public List<Member> getMemberList();
    	
}
