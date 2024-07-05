package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Long>{
    public Cart findByUsername(String username);
}
