package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Card;
// 카드
public interface CardRepository extends JpaRepository<Card, String>{

}
