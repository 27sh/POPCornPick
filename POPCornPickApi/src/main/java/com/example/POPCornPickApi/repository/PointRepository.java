package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Point;

public interface PointRepository extends JpaRepository<Point, Long>{

}
