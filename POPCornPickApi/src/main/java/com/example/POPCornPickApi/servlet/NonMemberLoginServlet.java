package com.example.POPCornPickApi.servlet;

import java.io.IOException;

import com.example.POPCornPickApi.dto.NonMemberLoginDto;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class NonMemberLoginServlet extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 1. 비회원 로그인 정보 파라미터 추출
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String birthdate = request.getParameter("birthdate");
        String password2 = request.getParameter("password2");

        // 2. 비회원 로그인 정보 DTO 객체 생성
        NonMemberLoginDto nonMemberLoginDto = new NonMemberLoginDto();
        nonMemberLoginDto.setName(name);
        nonMemberLoginDto.setTel(tel);
        nonMemberLoginDto.setBirthdate(birthdate);
        nonMemberLoginDto.setPassword2(password2);

        // 3. 비회원 로그인 처리 로직 ( 생략 )

        // 4. 세션에 비회원 로그인 정보 저장
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1800); // 30분
        session.setAttribute("nonMemberLoginDto", nonMemberLoginDto);

        // 5. 로그인 성공 페이지로 이동
        response.sendRedirect("/nonMemberLoginSuccess.jsp");
    }
	
	
	
	
}
