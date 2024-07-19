package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Utube {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String utubeNo;
	
	@OneToMany
	@JoinColumn(name = "movieDc", referencedColumnName = "movieDc", nullable = false)
	private Movie movie;
	
	
	@Column(nullable = true)
	private String vid;
	
	
	
	
	
}
