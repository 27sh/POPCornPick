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
public class Faq extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long faqNo;
	
	@Column(nullable = false)
	private String faqTitle;
	
	@Column(nullable = false)
	private String faqContent;
	
	@Column(nullable = true)
	private String faqFile;
	
	@Column(nullable = false)
	private String faqCategory;
	
	
}
