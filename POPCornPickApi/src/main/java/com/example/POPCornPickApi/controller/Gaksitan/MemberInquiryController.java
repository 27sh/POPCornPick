package com.example.POPCornPickApi.controller.Gaksitan;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Qna;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.QnaRepository;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/v1/memInquiry")
@PreAuthorize("hasRole('MEMBER')")
public class MemberInquiryController {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private ExpCinemaRepository expCinemaRepository;
	
	@PostMapping("/writeInquiry") // dto MultipratFile 필드 변수 선언 @ModelAttribute
	public ResponseEntity<?> writeInquiry(@RequestParam("qnaFile") MultipartFile file, Qna qna, @RequestParam("username") String username) {
		try {
			// 파일 저장 경로 설정
			String uploadDir = "C:/upload";
			File dest = new File(uploadDir, file.getOriginalFilename());
			
			// 파일 저장
			file.transferTo(dest);
			// 
			Member member = new Member();
			member.setUsername(username);
			qna.setMember(member);
			qnaRepository.save(qna);
			
			return ResponseEntity.ok("파일 업로드 성공");
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
		}
	}
	
	@GetMapping("/cinemaList")
	public List<String> cinemaList(@RequestParam("location") String location, HttpServletRequest request) {
		
		if(!location.equals("My 영화관")) {
			List<String> cinemaList = cinemaRepository.getCinemaNameListByLocation(location);
			
			return cinemaList;
		}else {
			String token = request.getHeader("Authorization").split(" ")[1];
			String username = jwtUtil.getUsername(token);
			List<ExpCinema> expCinemaList = expCinemaRepository.findByMemberUsername(username);
			List<String> cinemaNameList = new ArrayList<>();
			
			for(int i = 0; i < expCinemaList.size(); i++) {
				System.out.println(expCinemaList.get(i).getCinema().getCinemaNo());
				String cinemaName = cinemaRepository.getCinemaName(expCinemaList.get(i).getCinema().getCinemaNo());
				cinemaNameList.add(cinemaName);
			}
			
			return cinemaNameList;
		}
		
		
//		return null;
		
	}
	
	@GetMapping("/writeInquiry")
	public List<Qna> qnaList(HttpServletRequest request){
		String token = request.getHeader("Authorization").split(" ")[1];
		String username = jwtUtil.getUsername(token);
		Member member = new Member();
		member.setUsername(username);
		List<Qna> qnaList = qnaRepository.findByMember(member);
		
		return qnaList;
	}
	
	@GetMapping("/cinemaNo")
	public Long cinemaNo(@RequestParam("cinemaName") String cinemaName) {
		
		Long cinemaNo = cinemaRepository.findByCinemaName(cinemaName);
		
		return cinemaNo;
	}
	
	
	
}
