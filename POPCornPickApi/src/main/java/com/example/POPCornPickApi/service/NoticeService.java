package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
	
    public Page<Notice> findByNoticeTitleContaining(String noticeTitle, Pageable pageable) {
        return noticerepository.findByNoticeTitleContaining(noticeTitle, pageable);
    }

	
	
	public List<Notice> searchNoticesByTitle(String title) {
        return noticerepository.findByNoticeTitleContaining(title);
    }
	
    public Page<Notice> getNotices(Pageable pageable) {
        return noticerepository.findAll(pageable);
    }
	
//	public Page<Notice> searchByTitle(String noticeNo, int page, int size) {
//        Pageable pageable = PageRequest.of(page, size);
//        return noticerepository.findByNoticeTitleContaining(noticeNo, pageable);
//    }

//    public Page<Notice> findByCategory(String category, int page, int size) {
//        Pageable pageable = PageRequest.of(page, size);
//        return noticerepository.findByNoticeCategory(category, pageable);
//    }
	
	
	
}
