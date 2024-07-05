package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Payment;
//결제
public interface PaymentRepository extends JpaRepository<Payment, Long>{

	
}
