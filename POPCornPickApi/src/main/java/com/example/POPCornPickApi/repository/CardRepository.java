package com.example.POPCornPickApi.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Card;
// 카드
public interface CardRepository extends JpaRepository<Card, String>{

	public Card findByMember_UsernameAndCardCompanyAndCardEndDateAfterAndMoneyGreaterThan(String username, String cardCompany, Date cardEndDate, int money);
}
