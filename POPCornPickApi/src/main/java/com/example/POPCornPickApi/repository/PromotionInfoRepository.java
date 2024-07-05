package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.PromotionInfo;
//영화 홍보용 정보
public interface PromotionInfoRepository extends JpaRepository<PromotionInfo, Long>{

}
