package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Notice;
import com.example.POPCornPickApi.repository.NoticeRepository;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticerepository;
	
	
	public Notice saveNotice(Notice notice) {
		
		return noticerepository.save(notice);
				
	}
	
	public List<Notice> getAllNotice(){
		
		return noticerepository.findAll();
	}

	public Notice getnoticeDetial(Long noticeNo) {
		
		return noticerepository.findByNoticeNo(noticeNo);
	}
	
	
}
