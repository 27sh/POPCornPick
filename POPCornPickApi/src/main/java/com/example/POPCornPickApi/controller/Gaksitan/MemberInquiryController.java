package com.example.POPCornPickApi.controller.Gaksitan;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.entity.Qna;
import com.example.POPCornPickApi.repository.QnaRepository;

@RestController
@RequestMapping("/api/v1/memInquiry")
public class MemberInquiryController {
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@PostMapping("/writeInquiry")
	public ResponseEntity<?> writeInquiry(@RequestParam("qnaFile") MultipartFile file, Qna qna) {
		try {
			// 파일 저장 경로 설정
			String uploadDir = "C:/upload";
			File dest = new File(uploadDir, file.getOriginalFilename());
			
			// 파일 저장
			file.transferTo(dest);

			return ResponseEntity.ok("파일 업로드 성공");
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
		}
	}
	
	
	
	
	
	
}
