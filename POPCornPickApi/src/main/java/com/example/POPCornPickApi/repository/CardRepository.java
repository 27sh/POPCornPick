package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Card;

public interface CardRepository extends JpaRepository<Card, Long>{

}
