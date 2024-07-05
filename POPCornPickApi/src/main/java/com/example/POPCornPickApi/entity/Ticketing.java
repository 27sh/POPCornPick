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
public class Ticketing extends BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ticketingNo;
	
	@ManyToOne
	@JoinColumn(name = "telephone", referencedColumnName = "telephone", nullable = false)
	private UnknownMember unknownMember;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "detailNo", referencedColumnName = "detailNo", nullable = false)
	private MovieShowDetail movieShowDetail;
	
	@Column(nullable = false)
	private int ticketingRow;
	
	@Column(nullable = false)
	private int ticketingColumn;
	
	@Column(nullable = false)
	private int payTotalAmount;
	
	@Column(nullable = false)
	private boolean viewTF;
}
