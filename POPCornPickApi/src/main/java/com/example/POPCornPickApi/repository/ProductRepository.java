package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Product;
//상품
public interface ProductRepository extends JpaRepository<Product, Long>{

	public List<Product> findByProductNo(Product productNo);
   
	List<Product> findTop3ByProductType(String productType);

}
