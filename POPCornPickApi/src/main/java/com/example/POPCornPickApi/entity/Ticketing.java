package com.example.POPCornPickApi.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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
	@JoinColumn(name = "telephone", referencedColumnName = "telephone", nullable = true)
	private UnknownMember unknownMember;
	
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = true)
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "reservatedSeatNo", referencedColumnName = "reservatedSeatNo", nullable = false)
	private ReservatedSeat reservatedSeat;
	
	@Column(nullable = false)
	private int payTotalAmount;
	
	@Column(nullable = false)
	private boolean viewTF;
}
