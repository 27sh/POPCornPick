package com.example.POPCornPickApi.jwt;

import java.io.IOException;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import com.example.POPCornPickApi.dto.CustomUserDetails;
import com.example.POPCornPickApi.entity.Member;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JWTFilter extends OncePerRequestFilter{
	
	private final JWTUtil jwtUtil;
	
	public JWTFilter(JWTUtil jwtUtil) {
		this.jwtUtil = jwtUtil;
	}
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		//requestHeader 에서 Authorization 헤더를 찾음
		String authorization = request.getHeader("Authorization");
		
		// 토큰이 없거나 주어진 토큰과 다른 정보를 담은 토큰일 경우
		if(authorization == null || !authorization.startsWith("Bearer ")) {
			System.out.println("token null");
			filterChain.doFilter(request, response);
			// 조건에 해당되면 메소드 종료 (필수)
			return;
		}
		
		System.out.println("authorization now");
		// Bearer 부분 제거후 순수 토큰만 획득
		String token = authorization.split(" ")[1];
		
		// 토큰 소멸 시간 검증
		if(jwtUtil.isExpired(token)) {
			
			System.out.println("token expired");
			filterChain.doFilter(request, response);
			// 조건에 해당되면 메소드 종료 (필수)
			return;
		}
		
		//토큰에서 username, role 획득
		String username = jwtUtil.getUsername(token);
		String role = jwtUtil.getRole(token);
		
		Member user = new Member();
		user.setUsername(username);
		// password 는 token 에 없기 때문에 임시 비밀번호 대충 넣기
		user.setPassword("tempPassword");
		user.setRole(role);
		
		// UserDetails 에 회원 정보 객체 담기
		CustomUserDetails customUserDetails = new CustomUserDetails(user);
		
		// 스프링 시큐리티 인증 토큰 생성
		Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
		// 세션에 사용자 등록
		SecurityContextHolder.getContext().setAuthentication(authToken);
		
		filterChain.doFilter(request, response);
		
		
	}
	
	
	
	
}
