package com.example.POPCornPickApi.controller.Gaksitan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.POPCornPickApi.dto.AuthResponse;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.service.CustomUserDetailService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api/v1")
@CrossOrigin("*")
public class LoginController {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private CustomUserDetailService customUserDetailService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	
//	@GetMapping("/loginForm")
//	public String loginForm() {
//		return "loginForm";
//	}
	
	@PostMapping("/join")
	public String join(Member member) {
		String str = "";
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
	
	// 로그인 
		@PostMapping("/login")
	    public ResponseEntity<?> createAuthenticationToken(Member member, HttpServletResponse response) throws Exception {
	        authenticate(member.getUsername(), member.getPassword());

	        final UserDetails userDetails = customUserDetailService.loadUserByUsername(member.getUsername());
	        final String token = jwtUtil.createJwt(member.getUsername(), member.getRole(), 60*60*250L);

	        // JWT 토큰을 responseHeader에 추가
	        response.setHeader("Authorization", "Bearer " + token);

	        return ResponseEntity.ok(new AuthResponse(token));
	    }
		
		private void authenticate(String username, String password) throws Exception {
	        try {
	            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
	        } catch (DisabledException e) {
	            throw new Exception("USER_DISABLED", e);
	        } catch (BadCredentialsException e) {
	            throw new Exception("INVALID_CREDENTIALS", e);
	        }
	    }
		// 
	
	
}
