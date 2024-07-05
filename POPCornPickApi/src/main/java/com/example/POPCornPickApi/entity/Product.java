package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Product extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productNo;
	
	@Column(nullable = false)
	private String productName;
	
	@Column(nullable = false)
	private String productImg;
	
	@Column(nullable = false)
	private int productPrice;
	
	@Column(nullable = false)
	private String productType;
	
	@Column(nullable = false)
	private String productEndDate;
	
	@Column(nullable = false)
	private int productAmount;
	
}
