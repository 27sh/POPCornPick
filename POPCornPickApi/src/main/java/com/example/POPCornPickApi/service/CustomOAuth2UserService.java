//package com.example.POPCornPickApi.service;
//
//import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
//import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Service;
//
//import com.example.POPCornPickApi.dto.CustomOAuth2User;
//import com.example.POPCornPickApi.dto.GoogleResponse;
//import com.example.POPCornPickApi.dto.OAuth2Response;
//import com.example.POPCornPickApi.dto.UserDto;
//import com.example.POPCornPickApi.entity.Member;
//import com.example.POPCornPickApi.repository.MemberRepository;
//
//
//@Service
//public class CustomOAuth2UserService extends DefaultOAuth2UserService{
//	
//	private final MemberRepository memberRepository;
//	// 초기화
//	public CustomOAuth2UserService(MemberRepository memberRepository) {
//		this.memberRepository = memberRepository;
//	}
//	
//	@Override
//	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException{
//		
//		// userRequest 리소스 서버에서 제공하는 유저 정보
//		OAuth2User oAuth2User = super.loadUser(userRequest);
//		System.out.println("여기 - " + oAuth2User);
//		
//		// userRequest(유저 정보)가 제공된곳이 naver 인지 google 인지 구분하기 위한 변수 registrationId
//		String registrationId = userRequest.getClientRegistration().getRegistrationId();
//		
//		// OAuth2Response(라는 클래스) 는 직접 구현해서 받아야 함. (데이터를 제공하는 방식이 소셜 마다 달라서) -> 네이버의 데이터 제공 방식은 JSON 응답 방식에 response 라는 키 내부에 원하는 데이터가 들어있음 (ex : { resultcode=00, message=success, response={id=123123123, name=개발자} } 
//		// 구글은 { resultcode=00, message=success, id=123123123, name=개발자 } 이런식으로 키 내부가 아닌 외부에 존재해서 다른 방식으로 데이터를 받아줘야 해서
//		OAuth2Response oAuth2Response = null;
//		
//		
//		
//		if(registrationId.equals("google")) {
//			
//			oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());
//			System.out.println("여기서 변수명 찾기 | oAuth2Response : " + oAuth2Response.getCheck());
//			//System.out.println("oAuth2Response.getPhoneNumber : " + oAuth2User.getAttributes().get("genders"));
//			
//		}else if(registrationId.equals("naver")) {
//			// 이후 추가 가능하면 하기
//			
//			
//		}else {
//			return null;
//		}
//		
//		// 추후 작성
//		String username = oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();
//		
//		Member existData = memberRepository.findByUsername(username);
//		
//		System.out.println("username : " + username);
//		
//		if(existData == null) {
//			
//			Member member = new Member();
//			member.setUsername(username);
//			member.setEmail(oAuth2Response.getEmail());
//			member.setName(oAuth2Response.getName());
//			member.setRole("ROLE_USER");
//			//member.setGender(oAuth2Response.getGender());
//			//member.setTel(oAuth2Response.getPhoneNumber());
//			
//			memberRepository.save(member);
//			
//			UserDto userDto = new UserDto();
//			userDto.setUsername(username);
//			userDto.setName(oAuth2Response.getName());
//			userDto.setRole("ROLE_USER");
//			
//			return new CustomOAuth2User(userDto);
//			
//		}else {
//			
//			existData.setName(oAuth2Response.getName());
//			existData.setEmail(oAuth2Response.getEmail());
//			//existData.setGender(oAuth2Response.getGender());
//			//existData.setTel(oAuth2Response.getPhoneNumber());
//			
//			memberRepository.save(existData);
//			
//			UserDto userDto = new UserDto();
//			userDto.setUsername(existData.getUsername());
//			userDto.setName(oAuth2Response.getName());
//			userDto.setRole(existData.getRole());
//			
//			return new CustomOAuth2User(userDto);
//		}
//		
//		
//		
//		
//		
//	}
//	
//	
//	
//}
