package com.example.POPCornPickApi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Alarm;

public interface AlarmRepository extends JpaRepository<Alarm, Long>{

}
