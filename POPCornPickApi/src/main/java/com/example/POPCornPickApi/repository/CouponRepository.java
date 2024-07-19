package com.example.POPCornPickApi.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Coupon;
// 쿠폰
public interface CouponRepository extends JpaRepository<Coupon, Long>{
	
	public List<Coupon> findByMemberUsername(String username);

	public List<Coupon> findByMember_UsernameAndCouponNo_EndDateAfterOrderByCouponNo_EndDateAsc(String username, LocalDate currentDate);

	@Query("SELECT COUNT(c) FROM Coupon c WHERE c.member.username = :username")
    int countByMemberUsername(@Param("username") String username);
}
