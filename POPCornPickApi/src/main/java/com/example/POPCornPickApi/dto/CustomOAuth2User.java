package com.example.POPCornPickApi.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2User implements OAuth2User{
	
	private final UserDto userDto;
	
	public CustomOAuth2User(UserDto userDto) {
		this.userDto = userDto;
	}
	
	@Override
	public Map<String, Object> getAttributes() {
		// 소셜마다 데이터 형식이 달라서 하나로 형태를 정해서 받기 힘들기 때문에 사용하지 않고, 새로운 메서드를 만들어서 각각의 값을 받아 올 수 있게 만들거임.
		return null;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collection = new ArrayList<>();
		
		collection.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return userDto.getRole();
			}
		});
		
		return collection;
	}

	@Override
	public String getName() {
		return userDto.getName();
	}
	
	
	public String getUsername() {
		return userDto.getUsername();
	}
	
	
	
}
