package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Seat;

public interface SeatRepository extends JpaRepository<Seat, Long>{

}
