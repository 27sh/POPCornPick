package com.example.POPCornPickApi.controller.bscomeber1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.Notice;
import com.example.POPCornPickApi.service.NoticeService;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/admin")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("/announcement")
	public ResponseEntity<Notice> WriteNotice(@RequestBody Notice notice) {
		
		return ResponseEntity.ok(noticeService.saveNotice(notice));
	}
	
	@GetMapping("/announcementList")
	public List<Notice> getNoticeList(){
		
		System.out.println(noticeService.getAllNotice());
		
		return noticeService.getAllNotice();
	}
	
	@GetMapping("/announcementDetial/{noticeNo}")
	public ResponseEntity<Notice> noticeDetail(@PathVariable("noticeNo")Long noticeNo){
		
		Notice notice = noticeService.getnoticeDetial(noticeNo);
		
		return ResponseEntity.status(HttpStatus.OK).body(notice);
	}
	
}
