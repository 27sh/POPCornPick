package com.example.POPCornPickApi.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebMvcConfig implements WebMvcConfigurer {
	
	@Value("${spring.servlet.multipart.location}")
	String uploadPath;
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
			.addResourceHandler("/img/**") //웹 페이지에서 요청할 URL 경로"
			.addResourceLocations("file:///" +uploadPath);
	}
}
