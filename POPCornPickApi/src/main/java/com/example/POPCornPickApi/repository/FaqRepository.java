package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Faq;

public interface FaqRepository extends JpaRepository<Faq, Long>{
				
	public Faq findByFaqNo(Long faqNo);
	
	public Page<Faq> findAll(Pageable pageable);
	
	@Query("SELECT f FROM Faq f WHERE f.faqTitle LIKE %:title%")
	public List<Faq> findByFaqTitleContaining(@Param("title") String title);
	
	//public List<Faq> finByFaqNoList(Faq faqNo);
}
