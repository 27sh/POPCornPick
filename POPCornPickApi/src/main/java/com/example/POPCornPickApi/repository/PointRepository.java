package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Point;

public interface PointRepository extends JpaRepository<Point, Long>{
	@Query(value = "Select * from Point where pointNo = :pointNo", nativeQuery = true)
	public Point findBypointNo(@Param("pointNo") Long pointNo);
	
	List<Point> findByMemberUsername(String username);
	    
	@Query(value = "SELECT COALESCE(SUM(acheive), 0) FROM point WHERE username = :username;", nativeQuery = true)
	public int getTotalAcheiveByUsername(@Param("username") String username);
	
	@Query(value = "SELECT COALESCE(SUM(point_use), 0) FROM point WHERE username = :username", nativeQuery = true)
    public int getTotalPointUserByUsername(@Param("username") String username);
	
	@Query("SELECT SUM(p.acheive) - SUM(p.pointUse) FROM Point p WHERE p.member.username = :username")
    Integer findTotalPointsByUsername(@Param("username") String username);
}


