package com.example.POPCornPickApi.entity;

import java.sql.Date;

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
public class Event extends BaseEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long eventNo;
	
	@Column(nullable = false)
	private String eventTitle;
	
	@Column(nullable = false)
	private String eventContent;
	
	@Column(nullable = false)
	private Date startEvent;
	
	@Column(nullable = true)
	private Date endEvent;
	
	@Column(nullable = true)
	private String eventImgOriginName;
	
	@Column(nullable = true)
	private String eventImgNewName;
}
