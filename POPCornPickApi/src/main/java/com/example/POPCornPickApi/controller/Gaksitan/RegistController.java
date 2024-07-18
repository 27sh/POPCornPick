package com.example.POPCornPickApi.controller.Gaksitan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.MemberRepository;

@RestController
@RequestMapping("/api/v1/common")
public class RegistController {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@PostMapping("/join")
	public String join(@RequestBody Member member) {
		String str = "";
		System.out.println(member);
		boolean tf = memberRepository.existsByUsername(member.getUsername());
		
		if(tf == false) {
			if(member.getRole() == null) {
				member.setRole("ROLE_MEMBER");
			}
			member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
			memberRepository.save(member);
			str = "가입 성공";
		}else {
			str = "이미 존재하는 Id 입니다.";
		}
		
		return str;
	}
	
	
	
	
	
}
