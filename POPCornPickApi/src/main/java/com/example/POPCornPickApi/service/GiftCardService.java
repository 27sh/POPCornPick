package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.repository.GiftCardRepository;

@Service
public class GiftCardService {

	@Autowired
	private GiftCardRepository giftCardRepository;
	
	public int getGiftCardCount(String username) {
        return giftCardRepository.findByMemberUsername(username).size();
    }
}
