package com.example.POPCornPickApi.controller.bscomeber1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Faq;
import com.example.POPCornPickApi.service.FaqService;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/admin")
public class FaqController {

	@Autowired
	private FaqService faqservice;
	
	
	@PostMapping("/Frequently")
	public ResponseEntity<String> FaqWrite(@RequestBody Faq writeFaq) {
		
		
		
		return ResponseEntity.ok(faqservice.FaqWrite(writeFaq));
	}
	
	
	@GetMapping("/Frequently/{faqNo}")
	public ResponseEntity<Faq> getFaqDetial(@PathVariable("faqNo") Long faqNo) {
		
		Faq faq = faqservice.getfaqDetail(faqNo);
		//System.out.println("faqNo 확인하는 씨스아웃" + faq);		
		return ResponseEntity.status(HttpStatus.OK).body(faq);
	}
	
	@PutMapping("/FrequentlyModify")
	public ResponseEntity<Faq> modifyfaq(@RequestBody Faq modifyFaq) {
		//Long qnaNo = modifyFaq.getFaqNo(); 로그인기능 완료이후 얘로 바꿔줘야함 
		Long faqNo = 1L;
		Faq faq = faqservice.getfaqDetail(faqNo);
		System.out.println("에프에이큐엔오"+faqNo);
		System.out.println("에프에이뷰"+faq);
		if(faq != null) {
			System.out.println("수정 if문 들어왔는데");
			faq.setFaqCategory(modifyFaq.getFaqCategory());
			faq.setFaqTitle(modifyFaq.getFaqTitle());
			faq.setFaqContent(modifyFaq.getFaqContent());
			
			faq = faqservice.modifyFaq(faq);
			
			return ResponseEntity.ok().body(faq);
		}else {
			return ResponseEntity.badRequest().build();
		}
		
		
	}
		
}
