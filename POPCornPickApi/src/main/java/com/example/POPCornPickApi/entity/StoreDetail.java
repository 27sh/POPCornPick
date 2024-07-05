package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
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
public class StoreDetail extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long storeDetailNo;
	
	@ManyToOne
	@JoinColumn(name = "paymentNo", referencedColumnName = "paymentNo", nullable = false)
	private Payment payment;
	
	@ManyToOne
	@JoinColumn(name = "productNo", referencedColumnName = "productNo", nullable = false)
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "cartNo", referencedColumnName = "cartNo", nullable = false)
	private Cart cart;
	
	@ManyToOne
	@JoinColumn(name = "giftNo", referencedColumnName = "giftNo", nullable = false)
	private Gift gift;
	
	@Column(nullable = false)
	private int storeAmount;
	
	@Column(nullable = false)
	private String storeType;
}
