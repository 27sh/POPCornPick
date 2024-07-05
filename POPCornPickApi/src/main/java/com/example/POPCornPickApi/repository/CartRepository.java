package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Cart;
import com.example.POPCornPickApi.entity.Member;

public interface CartRepository extends JpaRepository<Cart, Long>{
    public Cart findByMemberUsername(String username);
}
