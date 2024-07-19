package com.example.POPCornPickApi.jwt;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.example.POPCornPickApi.dto.CustomUserDetails;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.MemberRepository;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginFilter extends UsernamePasswordAuthenticationFilter{
	
	private final AuthenticationManager authenticationManager;
	
	private final JWTUtil jwtUtil;
	
	private MemberRepository memberRepository;
	
	public LoginFilter(AuthenticationManager authenticationManager, JWTUtil jwtUtil) {
		this.authenticationManager = authenticationManager;
		this.jwtUtil = jwtUtil;
	}
	
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException{
		
		// 클라이언트에서 username, password 추출
		String username = obtainUsername(request);
		String password = obtainPassword(request);
		
		System.out.println("username : " + username + ", password : " + password);
		// 바구니 
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(username, password, null);
		
		return authenticationManager.authenticate(authToken);
	}
	
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) {
		
		CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
		String username = customUserDetails.getUsername();
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		Member member = memberRepository.findByUsername(username);
		
		// 권한 정보 추출 (Iterator 사용 대신 권한 목록 전체 사용)
//	    String role = authorities.stream()
//	            .map(GrantedAuthority::getAuthority)
////	            .collect(Collectors.joining(","));
//	            .findFirst()
//	            .orElse("");
		
//		String role = member.getRole();
		
		Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
		GrantedAuthority auth = iterator.next();
		
		String role = auth.getAuthority();
		System.out.println("토큰 발급시 role 값 : " + role);
		String token = jwtUtil.createJwt(username, role, null, null, 24*60*60*1000L); // 1일 
		
		response.addHeader("Authorization", "Bearer " + token);
		
		System.out.println("Login Success");
		
	}
	
	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) {
		
		response.setStatus(401);
		
		System.out.println("Login Fail");
		
	}
	
	
	
	
	
}
