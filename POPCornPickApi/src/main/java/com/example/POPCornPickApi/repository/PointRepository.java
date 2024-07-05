package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Point;

public interface PointRepository extends JpaRepository<Point, Long>{
	@Query(value = "Select * from Point where pointNo = :pointNo", nativeQuery = true)
	public Point findBypointNo(@Param("pointNo") Long pointNo);
}
