package com.example.POPCornPickApi.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Coupon;
import com.example.POPCornPickApi.entity.Member;
// 쿠폰
public interface CouponRepository extends JpaRepository<Coupon, Long>{
	
	public List<Coupon> findByMemberUsername(String username);

	public List<Coupon> findByMember_UsernameAndCouponNo_EndDateAfterOrderByCouponNo_EndDateAsc(String username, LocalDate currentDate);
}
