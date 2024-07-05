package com.example.POPCornPickApi.entity;

import java.sql.Date;

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
public class GiftCard extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long giftCardNo;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private Member member;
	
	@Column(nullable = false)
	private String giftCardType;
	
	@Column(nullable = false)
	private Date giftCardEndDate;
	
}
