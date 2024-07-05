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
public class Gift extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long giftNo;
	
	@ManyToOne
	@JoinColumn(name = "giftNo", referencedColumnName = "giftNo", nullable = false)
	private Gift gift;
	
	@Column(nullable = false)
	private String targetName;
	
	@Column(nullable = false)
	private String targetTel;
}
