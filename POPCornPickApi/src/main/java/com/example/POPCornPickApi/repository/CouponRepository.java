package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Coupon;
import com.example.POPCornPickApi.entity.Member;
// 쿠폰
public interface CouponRepository extends JpaRepository<Coupon, Long>{
	
	public List<Coupon> findByMemberUsername(String username);
}
