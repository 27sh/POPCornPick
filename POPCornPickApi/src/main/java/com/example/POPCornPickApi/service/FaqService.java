package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Faq;
import com.example.POPCornPickApi.repository.FaqRepository;

@Service
public class FaqService {

	@Autowired
	private FaqRepository faqrepository;
	
	public String FaqWrite(Faq faq) {
		
		try {
				
			faqrepository.save(faq);
			return "저장완료";
		}catch (Exception e) {
			return"실패";	
		} 
				
		
		
	}

	
}
