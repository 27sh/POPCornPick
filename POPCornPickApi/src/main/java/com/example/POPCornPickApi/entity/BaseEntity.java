package com.example.POPCornPickApi.entity;

import java.util.Date;

import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
@Data
public abstract class BaseEntity {

	private Date regdate;
	private Date moddate;
	@PrePersist
	protected void onCreate() {
		regdate = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		moddate = new Date();
	}
}
