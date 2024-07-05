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
public class QnA extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qnaNo;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private Member member;
	
	@Column(nullable = false)
	private String qnaTitle;
	
	@Column(nullable = false)
	private String qnaContent;
	
	@Column(nullable = true)
	private String qnaFile;
	
	@Column(nullable = false)
	private String qnaCategory;
	
	@Column(nullable = true)
	private String qnaAnswer;
}
