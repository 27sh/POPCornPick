package com.example.POPCornPickApi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class CancelList extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cancerListNo;
	
	@OneToOne
	@JoinColumn(name = "ticketingNo", referencedColumnName = "ticketingNo", nullable = false)
	private Ticketing ticketing;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = true)
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "telephone", referencedColumnName = "telephone", nullable = true)
	private UnknownMember unknownMember;
	
}
