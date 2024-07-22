package com.example.POPCornPickApi.controller.seowon0825;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.MemberDto;
import com.example.POPCornPickApi.service.MemberService;

@RestController
@RequestMapping("/api/v1/admin/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping
	public List<MemberDto> getMemberList(){
		System.out.println("memberController.....");
		System.out.println("memberController....." + memberService.getMemberList());
		
		return memberService.getMemberList();
	}
}
