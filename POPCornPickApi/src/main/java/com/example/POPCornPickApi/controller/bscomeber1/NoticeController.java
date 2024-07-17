package com.example.POPCornPickApi.controller.bscomeber1;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.POPCornPickApi.dto.NoticeListDto;
import com.example.POPCornPickApi.entity.Notice;
import com.example.POPCornPickApi.repository.PageableEditor;
import com.example.POPCornPickApi.service.NoticeService;

@RestController
//@CrossOrigin("*")
@RequestMapping("/api/v1/admin")
public class NoticeController {

	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;

	@Autowired
	private NoticeService noticeService;

	@PostMapping("/announcement")
	public ResponseEntity<String> writeNotice(@RequestParam("noticeFile") MultipartFile noticeFile,
			@ModelAttribute NoticeListDto noticedto) {

		Notice notice = new Notice();
		String originName = noticeFile.getOriginalFilename();

		notice.setNoticeTitle(noticedto.getNoticeTitle());
		notice.setNoticeCategory(noticedto.getNoticeCategory());
		notice.setNoticeContent(noticedto.getNoticeContent());
		notice.setNoticeFile(originName);

		String newName = UUID.randomUUID().toString() + "_" + originName;
		File file = new File(uploadDir, newName);

		try {
			noticeFile.transferTo(file);
			System.out.println("파일업로드 완료");
			boolean result = noticeService.registNotice(notice);
			if (result) {
				System.out.println("noticeForm File true");
				return ResponseEntity.ok("등록되었습니다.");
			} else {
				System.out.println("noticeForm File false");
				return ResponseEntity.status(500).body("등록이 안됩니다");
			}

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(500).body("파일 저장중 에러 발생: " + e.getMessage());
		}
	}

//	@PostMapping("/announcement")
//	public @ResponseBody String writeNotice(@RequestBody NoticeListDto noticedto) {
//		
//		Notice notice = new Notice();
//		String originName = noticedto.getFileNema();
//		
//		notice.setNoticeTitle(noticedto.getNoticeTitle());
//		notice.setNoticeCategory(noticedto.getNoticeCategory());
//		notice.setNoticeContent(noticedto.getNoticeContent());
//		
//		notice.setNoticeFile(originName);
//		String newName = UUID.randomUUID().toString() + "_" + originName;
//		File file = new File(uploadDir, newName);
//		
//		try {
//			noticedto.getImgfile().transferTo(file);
//			System.out.println("파일업로드 완료");
//			boolean result = noticeService.registNotice(notice);
//			if(result) {
//				System.out.println("noticeForm File true");
//				return "등록되었습니다.";
//			}else {
//				System.out.println("noticeForm File false");
//				return "등록이 안됩니다";
//			}
//			
//		}catch(IllegalStateException | IOException e){
//			e.printStackTrace();
//			return "파일 저장중 에러 발 생 : " + e.getMessage();
//		}
//
//	}

//	public ResponseEntity<Notice> WriteNotice(@RequestBody Notice notice) {
//		
//		return ResponseEntity.ok(noticeService.saveNotice(notice));
//	}

	
	 @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        binder.registerCustomEditor(Pageable.class, new PageableEditor());
	    }

	    @GetMapping("/announcementList")
	    public Page<Notice> getNoticeList(Pageable pageable) {
	       
	    	 System.out.println("Pageable: " + pageable);
	    	return noticeService.getNotices(pageable);
	    }
	
//	@GetMapping("/announcementList")
//	public List<Notice> getNoticeList() {
//
//		System.out.println(noticeService.getAllNotice());
//
//		return noticeService.getAllNotice();
//	}

	// 리스트페이지의 검색기능
	@GetMapping("/search")
	public List<Notice> searchNotices(@RequestParam("title") String title) {
		return noticeService.searchNoticesByTitle(title);
	}

	//pagenation
//	@GetMapping
//    public ResponseEntity<Page<Notice>> listNotices(@RequestParam(name = "noticeTitle", required = false, defaultValue = "") String noticeTitle,
//                                                    @PageableDefault(size = 10) Pageable pageable) {
//        Page<Notice> notices = noticeService.findByNoticeTitleContaining(noticeTitle, pageable);
//        return ResponseEntity.ok().body(notices);
//    }
	
	
	
	@GetMapping("/announcementDetial/{noticeNo}")
	public ResponseEntity<Notice> noticeDetail(@PathVariable("noticeNo") Long noticeNo) {

		Notice notice = noticeService.getnoticeDetial(noticeNo);

		return ResponseEntity.status(HttpStatus.OK).body(notice);
	}

	// noticeDetail
	@PutMapping("/announcementput/{noticeNo}")
	public ResponseEntity<Notice> putNoticeDetail(@RequestBody Notice modifynotice, @PathVariable("noticeNo") Long noticeNo) {

		
		Notice notice = noticeService.getnoticeDetial(noticeNo);

		System.out.println(notice);
		System.out.println("모디파이노티스" + modifynotice);
		if (notice != null) {
			System.out.println("수정을 시작합니다");
			notice.setNoticeContent(modifynotice.getNoticeContent());
			notice.setNoticeTitle(modifynotice.getNoticeTitle());

			if (modifynotice.getNoticeFile() != null && !modifynotice.getNoticeFile().isEmpty()) {
				notice.setNoticeFile(modifynotice.getNoticeFile());
			}

			notice = noticeService.modifynotice(notice);
			return ResponseEntity.ok().body(notice);
		} else {
			// 처리할 내용이 없다면 적절한 응답을 반환합니다.
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}

	}

}
