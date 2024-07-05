package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Alarm;
// 알람
public interface AlarmRepository extends JpaRepository<Alarm, Long>{
	
	@Query(value = "select * from alarm where username = :username and alarmview = false order by regdate DESC", nativeQuery = true)
	public Alarm findByMemberUsername(@Param("username") String username);
	
	
}
