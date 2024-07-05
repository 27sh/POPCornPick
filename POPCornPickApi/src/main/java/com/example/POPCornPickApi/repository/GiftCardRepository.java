package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.GiftCard;
import com.example.POPCornPickApi.entity.Member;

public interface GiftCardRepository extends JpaRepository<GiftCard, Long>{

	List<GiftCard> findByUserName(Member username);
}
