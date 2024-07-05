package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long>{
    public Cart findByUsername(String username);
}
