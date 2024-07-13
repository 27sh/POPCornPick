package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.CustomUserDetails;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.MemberRepository;

@Service
public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		// DB에서 조회
		Member member = memberRepository.findByUsername(username);
		
		if(member != null) {
			
			// UserDetails에 담아서 return 하면 AuthenticationManager 가 검증한다.
			return new CustomUserDetails(member);
			
		}
		
		return null;
	}
	
	
	
	
}
