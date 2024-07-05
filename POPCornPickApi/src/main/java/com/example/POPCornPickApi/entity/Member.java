package com.example.POPCornPickApi.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Member extends BaseEntity{

	@Id
	private String username;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	private String role;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false)
	private String tel;
	
	@Column(nullable = false)
	private String telecom;
	
	@Column(nullable = false)
	private String gender;
	
	@Column(nullable = false)
	private String email;
	
	@Column(nullable = false)
	private Date birthdate;
	
	@Column(nullable = true)
	private int warnAmount;
	
	@Column(nullable = true)
	private String memberState;
	
	@Column(nullable = true)
	private String token;
}	
	
	

	
