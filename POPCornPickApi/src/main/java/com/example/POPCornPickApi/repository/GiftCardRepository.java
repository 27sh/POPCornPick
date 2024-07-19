package com.example.POPCornPickApi.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.GiftCard;
import com.example.POPCornPickApi.entity.Member;

public interface GiftCardRepository extends JpaRepository<GiftCard, Long>{

	List<GiftCard> findByMemberUsername(String username);
	
	public List<GiftCard> findByMember_UsernameAndProduct_ProductTypeAndProduct_ProductEndDateAfterOrderByProduct_ProductEndDateAsc(String username, String productType, LocalDate currentDate);



}
