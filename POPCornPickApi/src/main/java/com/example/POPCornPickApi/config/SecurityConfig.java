package com.example.POPCornPickApi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		// csrf 검증 비활성화
		http
				.csrf((auth) -> auth.disable());
				
		// form 헝태 로그인 비활성화, UsernamePasswordAuthenticationFilter 비활성화
		http
				.formLogin((auth) -> auth.disable());
		
		// httpBasic 인증 방식 비활성화
		http
				.httpBasic((auth) -> auth.disable());
		
		// 경로별 인가 작업
		http
				.authorizeHttpRequests((auth) -> auth
						.requestMatchers("/", "/**").permitAll()
						//.requestMatchers("/admin/**").hasRole("ADMIN")
						//.requestMatchers("/my/**").hasAnyRole("ADMIN", "USER")
						.anyRequest().authenticated()
						);
		
		
		
		return http.build();
	}
	
	
	
}
