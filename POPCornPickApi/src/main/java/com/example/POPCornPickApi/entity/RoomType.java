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
public class RoomType extends BaseEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long roomTypeNo;
	
	@Column(nullable = false)
	private String roomName;
	
	@Column(nullable = false)
	private int roomTotalRow;
	
	@Column(nullable = false)
	private int roomTotalColumn;
	
	@Column(nullable = false)
	private String bigType;
	
	@Column(nullable = true)
	private String smallType;	
}
