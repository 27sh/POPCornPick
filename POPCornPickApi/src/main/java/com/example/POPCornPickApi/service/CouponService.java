package com.example.POPCornPickApi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.CouponType;
import com.example.POPCornPickApi.repository.CouponRepository;
import com.example.POPCornPickApi.repository.CouponTypeRepository;

@Service
public class CouponService {

	@Autowired
	private CouponRepository couponRepository;
	
	@Autowired
	private CouponTypeRepository couponTypeRepository;
	
	public int getCouponCount(String username) {
        return couponRepository.findByMemberUsername(username).size();
    }
	
	public boolean registCoupon(CouponType couponType) {
		try {
			couponTypeRepository.save(couponType);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public CouponType checkCouponType(String couponName) {
		CouponType result = couponTypeRepository.findByCouponName(couponName);
		return result;
	}
	
	
	
}
