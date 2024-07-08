package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.repository.CouponRepository;

@Service
public class CouponService {

	@Autowired
	private CouponRepository couponRepository;
	
	public int getCouponCount(String username) {
        return couponRepository.findByMemberUsername(username).size();
    }
}
