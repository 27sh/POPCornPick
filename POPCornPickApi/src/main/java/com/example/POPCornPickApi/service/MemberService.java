package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.dto.MemberDto;
import com.example.POPCornPickApi.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	public List<MemberDto> getMemberList(){
		return memberRepository.getMemberList().stream()
				.map(member -> new MemberDto(
						member.getUsername(),
						member.getName(),
						member.getRegdate(),
						member.getWarnAmount(),
						member.getMemberState()
						))
				.collect(Collectors.toList());
	}
}
