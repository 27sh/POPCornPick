package com.example.POPCornPickApi.entity;

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
public class UnknownMember extends BaseEntity{
	@Id
	private String telephone;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false)
	private String password;
}
