package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{
	public Notice findByNoticeNo(Long noticeNo);
	
	//public Notice noticeDetialncNo(Long noticeNo);
}
