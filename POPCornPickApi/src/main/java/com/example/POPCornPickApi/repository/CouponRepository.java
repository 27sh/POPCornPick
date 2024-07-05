package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long>{

}
