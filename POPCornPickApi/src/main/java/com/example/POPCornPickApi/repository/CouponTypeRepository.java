package com.example.POPCornPickApi.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.CouponType;
// 쿠폰 종류
public interface CouponTypeRepository extends JpaRepository<CouponType, Long>{
	
	Optional<CouponType> findByCouponNo(Long couponNo);
}
