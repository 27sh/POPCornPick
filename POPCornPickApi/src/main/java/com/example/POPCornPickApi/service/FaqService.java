package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Faq;
import com.example.POPCornPickApi.entity.Qna;
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
	
	public Faq getfaqDetail(Long faqNo){
		
		return faqrepository.findByFaqNo(faqNo);
	}

	public Faq modifyFaq(Faq faq) {

		return faqrepository.save(faq);
	}

	
	public List<Faq> getAllFaq(){
		
		return faqrepository.findAll();
	}
	
	public Page<Faq> getFaq(Pageable pageable){
		
		return faqrepository.findAll(pageable);
	}
	
	public List<Faq> searchFaqTitle(String title){
		return faqrepository.findByFaqTitleContaining(title);
	}
			
	
}
