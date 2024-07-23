package com.example.POPCornPickApi.controller.Gaksitan;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.AuthResponse;
import com.example.POPCornPickApi.dto.NonMemberLoginDto;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.UnknownMember;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.UnknownMemberRepository;
import com.example.POPCornPickApi.service.CustomUserDetailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api/v1/common")
//@CrossOrigin("*")
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
	
	@Autowired
	private UnknownMemberRepository unknownMemberRepository;
	
//	@GetMapping("/loginForm")
//	public String loginForm() {
//		return "loginForm";
//	}
	
	
	// 로그인 
	@PostMapping("/login")
    public ResponseEntity<?> createAuthenticationToken(Member member, HttpServletResponse response) throws Exception {
        authenticate(member.getUsername(), member.getPassword());
        System.out.println("role 값 체크 : " + member.getRole());
        final UserDetails userDetails = customUserDetailService.loadUserByUsername(member.getUsername());
        GrantedAuthority auth = userDetails.getAuthorities().iterator().next();
        String role = auth.getAuthority();
        final String token = jwtUtil.createJwt(member.getUsername(), role, null, null, null, 24*60*60*1000L); // 30분 1800초 (500L)
        
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
	
	//token 유효기간 체크
	@GetMapping("/tokenExpired") 
	public String tokenExpired(HttpServletRequest request) {
		String str = "";
		String BearerToken = request.getHeader("Authorization");
		String token = BearerToken.split(" ")[1];
		System.out.println("token : " + token);
		
		boolean tf = jwtUtil.isExpired(token); // isExpired 함수는 토큰이 유효하다면 false 를 리턴한다.
		
		if(tf == false) {
			str = "유효한 토큰입니다.";
		}else {
			str = "유효하지 못한 토큰입니다.";
		}
		
		return str;
	}
	
	@GetMapping("/tokenExpired2")
	public String tokenExpired2(HttpServletRequest request) {
		String str = "";
		String BearerToken = request.getHeader("Authorization");
		String token = BearerToken.split(" ")[1];
		System.out.println("token : " + token);
		
		boolean tf = jwtUtil.isExpired2(token); // 토큰이 유요하다면 true 를 리턴하게 새로 만든 메서드
		
		if(tf == true) {
			str = "유효한 토큰입니다.";
		}else {
			str = "유효하지 못한 토큰입니다.";
		}
		
		return str;
	}
	
//	@GetMapping("/loginCheck")
//	public String loginCheck(HttpServletRequest request) {
//		String str = "";
//		String token = request.getHeader("Authorization").split(" ")[1];
//		System.out.println("token : " + token);
//		
//		String username = jwtUtil.getUsername(token);
//		Member member = memberRepository.findByUsername(username);
//		String role = jwtUtil.getRole(token);
//		
//		if(role == null) {
//			role = member.getRole();
//		}
//		
//		boolean tf = jwtUtil.isExpired2(token);
//		
//		if(tf == true) {
//			System.out.println("username : " + username);
//			System.out.println("role : " + role);
//			str = username + " " + role;
//			System.out.println(str);
//		}else {
//			str = "유효하지 못한 토큰입니다.";
//		}
//		
//		return str;
//	}
	
	@GetMapping("/loginCheck")
	public ResponseEntity<?> loginCheck(@RequestHeader("Authorization") String bearerToken){
		
		String token = bearerToken.split(" ")[1];
		String username = jwtUtil.getUsername(token);
		String role = jwtUtil.getRole(token);
		String tel = jwtUtil.getTel(token);
		String password2 = jwtUtil.getPassword2(token);
		
		if(jwtUtil.isExpired(token)) {
			return ResponseEntity.status(401).body("Token Expired");
		}
		
		if(tel == null) {
			String memberInfo = username + " " + role;
			
			return ResponseEntity.ok().body(Collections.singletonMap("result", memberInfo));
		}else {
			String nonMemberInfo = username + " " + role + " " + tel + " " + password2;
			return ResponseEntity.ok().body(Collections.singletonMap("result", nonMemberInfo));
		}
		
	}
	
	@PostMapping("/nonMemberLogin")
	public String nonMemberLogin(NonMemberLoginDto nonMemberLoginDto, HttpServletResponse response) {
		String str = "";
		String token = jwtUtil.createJwt(nonMemberLoginDto.getName(), "ROLE_NONMEMBER", nonMemberLoginDto.getTel(), nonMemberLoginDto.getBirthdate(), nonMemberLoginDto.getPassword2(), 24*60*60*1000L);
		
		UnknownMember unknownMember = new UnknownMember(nonMemberLoginDto.getName(), nonMemberLoginDto.getTel(), nonMemberLoginDto.getPassword2());
		unknownMemberRepository.save(unknownMember);
		response.addHeader("Authorization", "Bearer " + token);
		
		System.out.println("nonMemberLogin Success");
		str = "nonMemberLogin Success";
		
		return str;
	}
	
	@GetMapping("/getUsername")
	public String getUsername(HttpServletRequest request) {
		String token = request.getHeader("Authorization").split(" ")[1];
		String username = jwtUtil.getUsername(token);
		
		return username;
	}
	
	
	
	
}
