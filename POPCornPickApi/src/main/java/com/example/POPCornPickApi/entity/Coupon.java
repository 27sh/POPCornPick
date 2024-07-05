package com.example.POPCornPickApi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Coupon extends BaseEntity{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long issueNo;
	
	@ManyToOne
	@JoinColumn(name = "couponNo", referencedColumnName = "couponNo", nullable = false)
	private CouponType couponNo;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private Member member;
	
}
