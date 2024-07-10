package com.example.POPCornPickApi.controller.bscomeber1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
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
	
		
}
