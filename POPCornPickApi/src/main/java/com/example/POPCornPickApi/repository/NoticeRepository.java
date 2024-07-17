package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{
	public Notice findByNoticeNo(Long noticeNo);
	
	//public Notice noticeDetialncNo(Long noticeNo);
	
	@Query("SELECT n FROM Notice n WHERE n.noticeTitle LIKE %:title%")
    List<Notice> findByNoticeTitleContaining(@Param("title") String title); 
	
	//페이지네이션
	 Page<Notice> findByNoticeTitleContaining(String noticeNo, Pageable pageable);
	 
	 public Page<Notice> findAll(Pageable pageable);
	 
     Notice findFirstByOrderByRegdateDesc();
}
