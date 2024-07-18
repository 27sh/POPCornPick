package com.example.POPCornPickApi.jwt;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;

@Component
public class JWTUtil {
	
	private SecretKey secretKey;
	
	public JWTUtil(@Value("${spring.jwt.secret}") String secret) {
		
		secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), Jwts.SIG.HS256.key().build().getAlgorithm());
		
	}
	
	public String getUsername(String token) { // 이 메소드 사용시 로그인해서 인증받은 유저의 아이디를 가져올 수 있음.

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("username", String.class);
    }

    public String getRole(String token) { // 이 메소드 사용시 로그인해서 인증받은 유저의 role 값을 가져올 수 있음.

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("role", String.class);
    }

    public Boolean isExpired(String token) { // 토큰의 유효기간을 검증해서 유효하면 false 를 리턴

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().getExpiration().before(new Date());
    }
	
    public Boolean isExpired2(String token) { // 토큰의 유효기간을 검증해서 유효하면 true 를 리턴
    	
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().getExpiration().after(new Date());
    }
    
	public String createJwt(String username, String role, String tel, String password2, Long expiredMs) {
		
		return Jwts.builder()
				.claim("username", username)
				.claim("role", role)
				.claim("tel", tel)
				.claim("password2", password2)
				.issuedAt(new Date(System.currentTimeMillis()))
				.expiration(new Date(System.currentTimeMillis() + expiredMs))
				.signWith(secretKey)
				.compact();
	}
	
	
	
}
