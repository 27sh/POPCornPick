package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.CouponType;
// 쿠폰 종료
public interface CouponTypeRepository extends JpaRepository<CouponType, Long>{
}
