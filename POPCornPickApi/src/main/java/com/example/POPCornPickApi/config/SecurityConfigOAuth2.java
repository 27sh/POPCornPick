//package com.example.POPCornPickApi.config;
//
//import java.util.Arrays;
//import java.util.Collections;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//import org.springframework.web.cors.CorsConfiguration;
//import org.springframework.web.cors.CorsConfigurationSource;
//import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
//
//import com.example.POPCornPickApi.jwt.JWTFilter;
//import com.example.POPCornPickApi.jwt.JWTUtil;
//import com.example.POPCornPickApi.oauth2.CustomSuccessHandler;
//import com.example.POPCornPickApi.service.CustomOAuth2UserService;
//
//import jakarta.servlet.http.HttpServletRequest;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfigOAuth2 {
//	
//	private final AuthenticationConfiguration authenticationConfiguration;
//	private final CustomOAuth2UserService customOAuth2UserService;
//	private final CustomSuccessHandler customSuccessHandler;
//	private final JWTUtil jwtUtil;
//	
//	public SecurityConfigOAuth2(CustomOAuth2UserService customOAuth2UserService, CustomSuccessHandler customSuccessHandler, JWTUtil jwtUtil, AuthenticationConfiguration authenticationConfiguration) {
//		this.authenticationConfiguration = authenticationConfiguration;
//		this.customOAuth2UserService = customOAuth2UserService;
//		this.customSuccessHandler = customSuccessHandler;
//		this.jwtUtil = jwtUtil;
//	}
//	
//	// AuthenticationManager Bean 등록
//	@Bean
//	public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception{
//		
//		return configuration.getAuthenticationManager();
//	}
//	
//	
//	@Bean
//	public BCryptPasswordEncoder bCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
////	@Bean -----------------------
////	public CorsConfigurationSource corsConfigurationSource() {
////	    CorsConfiguration configuration = new CorsConfiguration();
////	    configuration.setAllowedOrigins(Arrays.asList("http://localhost:8080"));
////	    configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
////	    configuration.setAllowedHeaders(Arrays.asList("*"));
////	    configuration.setAllowCredentials(true);
////	    configuration.setMaxAge(3600L);
////	    configuration.setExposedHeaders(Arrays.asList("Set-Cookie", "Authorization"));
////
////	    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
////	    source.registerCorsConfiguration("/**", configuration);
////	    
////	    return source;
////	} -------------------
//	
//	
//	
//	@Bean
//	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
//		
//		// CORS 설정
//		http
//				.cors(corsCustomizer -> corsCustomizer.configurationSource(new CorsConfigurationSource() {
//
//					@Override
//					public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
//						
//						CorsConfiguration configuration = new CorsConfiguration();
//					    configuration.setAllowedOrigins(Arrays.asList("http://localhost:8080"));
//					    configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
//					    configuration.setAllowedHeaders(Arrays.asList("*"));
//					    configuration.setAllowCredentials(true);
//					    configuration.setMaxAge(3600L);
//					    configuration.setExposedHeaders(Arrays.asList("Set-Cookie", "Authorization"));
//					    
//					    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//					    source.registerCorsConfiguration("/**", configuration);
//						
//						return configuration;
//					}
//					
//					
//					
////		            @Override -------------------------
////		            public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
////		
////		                CorsConfiguration configuration = new CorsConfiguration();
////		
////		                configuration.setAllowedOrigins(Collections.singletonList("*"));
////		                configuration.setAllowedMethods(Collections.singletonList("*"));
////		                configuration.setAllowedHeaders(Collections.singletonList("*"));
////		                configuration.setMaxAge(3600L);
////		
////		                configuration.setExposedHeaders(Collections.singletonList("Set-Cookie"));
////		                configuration.setExposedHeaders(Collections.singletonList("Authorization"));
////		
////		                return configuration;
////		            } -------------------------------
//		        }));
//		
//		
//		// csrf 검증 비활성화
//		http
//				.csrf((auth) -> auth.disable());
//				
//		// form 헝태 로그인 비활성화, UsernamePasswordAuthenticationFilter 비활성화
//		http
//				.formLogin((auth) -> auth.disable());
//		
//		// httpBasic 인증 방식 비활성화
//		http
//				.httpBasic((auth) -> auth.disable());
//		
//		// 경로별 인가 작업
//		http
//				.authorizeHttpRequests((auth) -> auth
//						.requestMatchers("/", "/**").permitAll()
//						//.requestMatchers("/admin/**").hasRole("ADMIN")
//						//.requestMatchers("/my/**").hasAnyRole("ADMIN", "USER")
//						.anyRequest().authenticated()
//						);
//		
//		// JWTFilter 추가 
//		http
//				.addFilterBefore(new JWTFilter(jwtUtil), UsernamePasswordAuthenticationFilter.class);
//		
//		
//		http
//				.oauth2Login((oauth2) -> oauth2
//						.userInfoEndpoint((UserInfoEndpointConfig) -> UserInfoEndpointConfig
//								.userService(customOAuth2UserService))
//				.successHandler(customSuccessHandler)
//		);
//
//		// 세션 설정 : STATELESS
//        http
//        		.sessionManagement((session) -> session
//        		.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
//		
//        
//        
//        
//		return http.build();
//	}
//	
//	
//	
//}
