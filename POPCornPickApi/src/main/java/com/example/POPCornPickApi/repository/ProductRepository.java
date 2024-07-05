package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Product;
//상품
public interface ProductRepository extends JpaRepository<Product, Long>{
    public Product findByProductNo(Long productNo);
    
    public List<Product> findByProductList(Product productNo);
   


}
