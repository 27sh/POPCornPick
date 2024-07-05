package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

public interface GiftRepository extends JpaRepository<Gift, Long> {
    public Gift findByUsername(String username);
}
