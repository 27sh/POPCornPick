package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreDetailRepository extends JpaRepository<StoreDetail, Long>{
    @Query(value = "select * from storedetail Where storeDetailNo = :storeDetailNo AND paymentTf = false", nativeQuery = true)
    public StoreDetail findByStoreDetailNo(@Param("storeDetailNo") Long storeDetailNo);
}
