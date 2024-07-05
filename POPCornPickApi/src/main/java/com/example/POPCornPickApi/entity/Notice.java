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
public class Notice extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long noticeNo;
	
	@Column(nullable = false)
	private String noticeTitle;
	
	@Column(nullable = false)
	private String noticeContent;
	
	@Column(nullable = true)
	private String noticeFile;
	
	@Column(nullable = false)
	private String noticeCategory;
}
