package com.example.POPCornPickApi.config;

import java.util.Collections;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.example.POPCornPickApi.jwt.JWTFilter;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.jwt.LoginFilter;

import jakarta.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    private final AuthenticationConfiguration authenticationConfiguration;
    private final JWTUtil jwtUtil;
    
    public SecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtil jwtUtil) {
        this.authenticationConfiguration = authenticationConfiguration;
        this.jwtUtil = jwtUtil;
    }
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
    
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        
        http
                .cors((cors) -> cors
                        .configurationSource(corsConfigurationSource()));
        
        // csrf 검증 비활성화
        http
                .csrf((csrf) -> csrf.disable());
        
        // form 헝태 로그인 비활성화, UsernamePasswordAuthenticationFilter 비활성화
        http
                .formLogin((formLogin) -> formLogin.disable());
        
        // httpBasic 인증 방식 비활성화
        http
                .httpBasic((httpBasic) -> httpBasic.disable());
        
        // 로그아웃 설정
        http
                .logout((logout) -> logout
                    .permitAll()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/main")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID"));
        
        // 경로별 인가 작업
        http
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/", "/main", "/login", "/join", "/loginProc", "/joinProc", "/**").permitAll()
                        .requestMatchers("/admin", "/admin/**").hasRole("ADMIN")
                        .anyRequest().authenticated());
        
        // JWTFilter 추가 
        http
                .addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil), UsernamePasswordAuthenticationFilter.class);
        
        http
                .addFilterAt(new JWTFilter(jwtUtil), LoginFilter.class);
        
        // 세션 설정 : STATELESS 
        http
                .sessionManagement((session) -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        
        return http.build();
    }
    
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Collections.singletonList("http://localhost:8080"));
        configuration.setAllowedMethods(Collections.singletonList("*"));
        configuration.setAllowCredentials(true);
        configuration.setAllowedHeaders(Collections.singletonList("*"));
        configuration.setMaxAge(3600L);
        configuration.setExposedHeaders(Collections.singletonList("Authorization"));
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
