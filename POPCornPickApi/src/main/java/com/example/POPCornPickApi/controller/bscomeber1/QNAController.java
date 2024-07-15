package com.example.POPCornPickApi.controller.bscomeber1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Qna;
import com.example.POPCornPickApi.service.QnaService;

//@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/admin")
public class QNAController {

	@Autowired
	private QnaService qnaservice;
	
	
	@GetMapping("/inquiry")
	public List<Qna> QnaList() {
		
		return qnaservice.getAllQna();      
	}
	/*
	@RequestMapping("/inquiry/{qnaNo}")
	public ResponseEntity<Qna> QnaDetail(@PathVariable ("qnaNo")Long qnaNo) {
		
		Qna qna = qnaservice.getQnaDetail(qnaNo);
		
		return ResponseEntity.status(HttpStatus.OK).body(qna);
	}
	*/
	
	@GetMapping("/inquiry/{qnaNo}")
	public ResponseEntity<Qna> QnaDetail(@PathVariable("qnaNo")Long qnaNo){
		
		
		Qna qna = qnaservice.getQnaDetail(qnaNo);
				
		return ResponseEntity.status(HttpStatus.OK).body(qna);
	}
	
	
	@PutMapping("/inquiryDetial")
	public ResponseEntity<Qna> updateQna(@RequestBody Qna updatedQna){
		Long qnaNo = updatedQna.getQnaNo();
		Qna qna = qnaservice.getQnaDetail(qnaNo);
		
		System.out.println("zbdpsdpdl : " + qna);
		if (qna != null) {
	        qna.setQnaCategory(updatedQna.getQnaCategory());
	        qna.setQnaTitle(updatedQna.getQnaTitle());
	        qna.setQnaContent(updatedQna.getQnaContent());
	        qna.setQnaAnswer(updatedQna.getQnaAnswer());

	        qna = qnaservice.updateQna(qna);

	        return ResponseEntity.ok().body(qna); 
	    } else {
	        return ResponseEntity.badRequest().build(); 
	    }
		
	}
	
	
	
	
}
