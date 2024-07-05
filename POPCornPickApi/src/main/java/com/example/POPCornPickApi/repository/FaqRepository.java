package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Faq;

public interface FaqRepository extends JpaRepository<Faq, Long>{
	
	List<Faq> findByFaqNo(Faq faqNo);
}
