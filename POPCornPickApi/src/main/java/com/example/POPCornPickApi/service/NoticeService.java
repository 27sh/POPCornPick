package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Faq;
import com.example.POPCornPickApi.entity.Notice;
import com.example.POPCornPickApi.repository.NoticeRepository;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticerepository;
	
	
	public Notice saveNotice(Notice notice) {
		
		return noticerepository.save(notice);
				
	}
	
	public boolean registNotice(Notice notice) {
		try {
			notice = noticerepository.save(notice);
			
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public List<Notice> getAllNotice(){
		
		return noticerepository.findAll();
	}

	public Notice getnoticeDetial(Long noticeNo) {
		
		return noticerepository.findByNoticeNo(noticeNo);
	}
	
	public Notice modifynotice(Notice nott) {

		return noticerepository.save(nott);
	}
	
	
	
	
	
}
