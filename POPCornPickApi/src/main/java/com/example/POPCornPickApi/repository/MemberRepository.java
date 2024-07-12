package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
    public Member findByUsername(Member username);
    public Member findByUsername(String username);
    
    public boolean existsByUsername(String username);
    
    
}
