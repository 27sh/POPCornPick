package com.example.POPCornPickApi.config;

import java.util.Collections;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.example.POPCornPickApi.jwt.JWTFilter;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.jwt.LoginFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
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
    public HttpFirewall allowNonPrintableAsciiCharacters() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedPercent(true);
        firewall.setAllowSemicolon(true);
        firewall.setAllowUrlEncodedSlash(true);
        firewall.setAllowUrlEncodedDoubleSlash(true);
        firewall.setAllowBackSlash(true);
        firewall.setAllowNull(true);
        firewall.setAllowUrlEncodedCarriageReturn(true);
        firewall.setAllowUrlEncodedLineFeed(true);
        firewall.setAllowUrlEncodedLineSeparator(true);
        firewall.setAllowUrlEncodedParagraphSeparator(true);
        firewall.setAllowUrlEncodedPeriod(true);
        firewall.setUnsafeAllowAnyHttpMethod(true);
//        firewall.setAllowNonAscii(true); 지금 버전에 없는 메서드
        return firewall;
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
                        .requestMatchers("/", "api/v1/common/**", "api/v1/main/**", "api/v1/memberCinema/**", "api/v1/reservation/**", "/api/v1/schedule/**").permitAll()
                        .requestMatchers("api/v1/member/**").hasRole("MEMBER")
                        .requestMatchers("/admin", "/admin/**").hasRole("ADMIN")
                        .anyRequest().authenticated());
        
        // JWTFilter 추가 --> LoginFilter를 UsernamePasswordAuthenticationFilter 전에 추가
        http
        		.addFilterBefore(new JWTFilter(jwtUtil), LoginFilter.class);
        
        http
                .addFilterAt(new LoginFilter(authenticationManager(authenticationConfiguration), jwtUtil), UsernamePasswordAuthenticationFilter.class);
        
        
        // 세션 설정 : STATELESS 
        http
                .sessionManagement((session) -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        
//        @Override
//        public void configure(WebSecurity web) throws Exception {
//            web.httpFirewall(allowNonPrintableAsciiCharacters());
//        }
        
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
    
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer(HttpFirewall allowUrlEncodedCharactersHttpFirewall) {
        return web -> web.httpFirewall(allowUrlEncodedCharactersHttpFirewall);
    }
    
    
}
