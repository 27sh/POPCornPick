package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{
    public Product findByProductNo(Long productNo);
}
