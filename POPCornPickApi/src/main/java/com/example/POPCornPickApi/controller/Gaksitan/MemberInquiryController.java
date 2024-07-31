package com.example.POPCornPickApi.controller.Gaksitan;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.QnaDto;
import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Qna;
import com.example.POPCornPickApi.jwt.JWTUtil;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.QnaRepository;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/v1/memInquiry")
@PreAuthorize("hasRole('MEMBER')")
public class MemberInquiryController {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private JWTUtil jwtUtil;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private ExpCinemaRepository expCinemaRepository;
	
	@Value("${upload.path}")
	private String uploadPath;
	
//	@PostMapping("/writeInquiry") // dto MultipratFile 필드 변수 선언 @ModelAttribute
//	public ResponseEntity<?> writeInquiry(@RequestParam("qnaFile") MultipartFile file, Qna qna, @RequestParam("username") String username) {
//		try {
//			// 파일 저장 경로 설정
//			String uploadDir = "C:/upload";
//			File dest = new File(uploadDir, file.getOriginalFilename());
//			
//			// 파일 저장
//			file.transferTo(dest);
//			// 
//			Member member = new Member();
//			member.setUsername(username);
//			qna.setMember(member);
//			qnaRepository.save(qna);
//			
//			return ResponseEntity.ok("파일 업로드 성공");
//		} catch (IOException e) {
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
//		}
//	}
	
	@PostMapping("/writeInquiry") // dto MultipratFile 필드 변수 선언 @ModelAttribute
	public ResponseEntity<?> writeInquiry(@ModelAttribute QnaDto qnaDto, HttpServletRequest request) {
		try {
			Qna qna = new Qna();
			Member member = new Member();
			String token = request.getHeader("Authorization").split(" ")[1];
			String username = jwtUtil.getUsername(token);
			member = memberRepository.findByUsername(username);
			//member.setUsername(qnaDto.getUsername());
			System.out.println("member : " + member);
			
			qna.setMember(member);
			qna.setQnaTitle(qnaDto.getQnaTitle());
			qna.setQnaContent(qnaDto.getQnaContent());
			qna.setQnaBigCategory(qnaDto.getQnaBigCategory());
			qna.setQnaSmallCategory(qnaDto.getQnaSmallCategory());
			qna.setQnaType(qnaDto.getQnaType());
			qna.setQnaCinemaLocation(qnaDto.getQnaCinemaLocation());
			qna.setQnaCinemaName(qnaDto.getQnaCinemaName());
			
			
			if(qnaDto.getQnaFile() != null && !qnaDto.getQnaFile().isEmpty()) {
				String originName = qnaDto.getQnaFile().getOriginalFilename();
				System.out.println(originName);
				String extension = originName.substring(originName.lastIndexOf('.'));
				System.out.println(extension);
				String newName = UUID.randomUUID().toString() + "--" + originName;// + extension;
				File file = new File("C:/upload/" + newName);
				String uploadDir = "classpath:static/upload";
				File file2 = new File(uploadPath, newName);
				qna.setQnaFile(newName);
				List<String> imageExtensions = new ArrayList<>();
				imageExtensions.add(".jpg");
				imageExtensions.add(".jpeg");
				imageExtensions.add(".png");
				imageExtensions.add(".gif");
				
				if(imageExtensions.contains(extension) == false) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("파일 업로드 실패: 이미지 파일만 첨부가 가능합니다.");
				}
				
				try {
					
			        //qnaDto.getQnaFile().transferTo(file);
			        qnaDto.getQnaFile().transferTo(file2);
			        System.out.println("파일 업로드 성공....");
			           
			        //썸네일 생성
			        //String thumbnailSaveName = "s_" + newName;
			        //board.setThumbnailName(thumbnailSaveName);
			        
			        //File thumbfile = new File(uploadPath + thumbnailSaveName);
//			        File ufile = new File(uploadPath + newName);
			        
			        //Thumbnails.of(ufile).size(100,100).toFile(thumbfile);
			        System.out.println("qnaDto : " + qnaDto);
			            
			            
			    }catch(IOException | IllegalStateException  e){
			    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패: " + e.getMessage());
			    }
				
				
			}
			
			qnaRepository.save(qna);
			
			return ResponseEntity.ok("파일 업로드 성공");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의 등록 실패: " + e.getMessage());
		}
	}
	
	@GetMapping("/cinemaList")
	public List<Cinema> cinemaList(@RequestParam("location") String location, HttpServletRequest request) {
		
		if(!location.equals("My 영화관")) {
//			List<String> cinemaList = cinemaRepository.getCinemaNameListByLocation(location);
			List<Cinema> cinemaList = cinemaRepository.findByCinemaLocation(location);
			return cinemaList;
		}else {
			String token = request.getHeader("Authorization").split(" ")[1];
			String username = jwtUtil.getUsername(token);
			List<ExpCinema> expCinemaList = expCinemaRepository.findByMemberUsername(username);
			List<Cinema> expCinemaList2 = new ArrayList<>();
			
			for(int i = 0; i < expCinemaList.size(); i++) {
				System.out.println(expCinemaList.get(i).getCinema().getCinemaName());
				Cinema cinemaName = cinemaRepository.getCinemaFindByCinemaNo(expCinemaList.get(i).getCinema().getCinemaNo());
				expCinemaList2.add(cinemaName);
			}
			
			return expCinemaList2;
		}
		
		
//		return null;
		
	}
	
	@GetMapping("/cinemaNo")
	public Long cinemaNo(@RequestParam("cinemaName") String cinemaName) {
		
		Long cinemaNo = cinemaRepository.findByCinemaName(cinemaName);
		
		return cinemaNo;
	}
	
	@GetMapping("/inquiry")
	public List<Qna> qnaList(HttpServletRequest request){
		String token = request.getHeader("Authorization").split(" ")[1];
		String username = jwtUtil.getUsername(token);
		Member member = new Member();
		member.setUsername(username);
//		List<Qna> qnaList = new ArrayList<>();
		List<Qna> qnaList = qnaRepository.findByMember(member);
		
//		System.out.println("qnaList 확인용 : " + qnaList);
		return qnaList;
	}
	
	@GetMapping("/inquiryDetail")
	public Qna inquiryDetail() {
		
		
		
		return null;
	}
	
	@GetMapping("/qnaDetail")
	public Qna qnaDetail(HttpServletRequest request, @RequestParam("qnaNo") Long qnaNo) {
		
		Qna qna = qnaRepository.findByQnaNo(qnaNo);
		System.out.println(qna);
		return qna;
	}
	
	@GetMapping("/editInquiry")
	public Qna editInquiry(@RequestParam("qnaNo") Long qnaNo) {
		
		String str = "";
		if(qnaNo != null) {
			Qna qna = qnaRepository.findByQnaNo(qnaNo);
			return qna;
		}else {
			return null;
		}
		
	}
	
	@PutMapping("/editInquiry")
	public ResponseEntity<?> editInquiry(@ModelAttribute QnaDto qnaDto, HttpServletRequest request) {
		try {
			Qna qna = new Qna();
			String qna_No = request.getParameter("qnaNo");
			Long qnaNo = Long.parseLong(qna_No);
			Member member = new Member();
			String token = request.getHeader("Authorization").split(" ")[1];
			String username = jwtUtil.getUsername(token);
			member = memberRepository.findByUsername(username);
			//member.setUsername(qnaDto.getUsername());
			System.out.println("member : " + member);
			
			qna.setQnaNo(qnaNo);
			qna.setMember(member);
			qna.setQnaTitle(qnaDto.getQnaTitle());
			qna.setQnaContent(qnaDto.getQnaContent());
			qna.setQnaBigCategory(qnaDto.getQnaBigCategory());
			qna.setQnaSmallCategory(qnaDto.getQnaSmallCategory());
			qna.setQnaType(qnaDto.getQnaType());
			qna.setQnaCinemaLocation(qnaDto.getQnaCinemaLocation());
			qna.setQnaCinemaName(qnaDto.getQnaCinemaName());
			
			
			if(qnaDto.getQnaFile() != null && !qnaDto.getQnaFile().isEmpty()) {
				String originName = qnaDto.getQnaFile().getOriginalFilename();
				System.out.println(originName);
				String extension = originName.substring(originName.lastIndexOf('.'));
				System.out.println(extension);
				String newName = UUID.randomUUID().toString() + "--" + originName;// + extension;
				File file = new File("C:/upload/" + newName);
				String uploadDir = "classpath:static/upload";
				File file2 = new File(uploadPath, newName);
				qna.setQnaFile(newName);
				List<String> imageExtensions = new ArrayList<>();
				imageExtensions.add(".jpg");
				imageExtensions.add(".jpeg");
				imageExtensions.add(".png");
				imageExtensions.add(".gif");
				
				if(imageExtensions.contains(extension) == false) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("파일 업로드 실패: 이미지 파일만 첨부가 가능합니다.");
				}
				
				try {
					
			        //qnaDto.getQnaFile().transferTo(file);
			        qnaDto.getQnaFile().transferTo(file2);
			        System.out.println("파일 업로드 성공....");
			           
			        //썸네일 생성
			        //String thumbnailSaveName = "s_" + newName;
			        //board.setThumbnailName(thumbnailSaveName);
			        
			        //File thumbfile = new File(uploadPath + thumbnailSaveName);
//			        File ufile = new File(uploadPath + newName);
			        
			        //Thumbnails.of(ufile).size(100,100).toFile(thumbfile);
			        System.out.println("qnaDto : " + qnaDto);
			            
			            
			    }catch(IOException | IllegalStateException  e){
			    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패: " + e.getMessage());
			    }
				
				
			}
			
			qnaRepository.save(qna);
			
			return ResponseEntity.ok("파일 업로드 성공");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("문의 등록 실패: " + e.getMessage());
		}
		
		
	}
	
	@DeleteMapping("/deleteInquiry")
	public String deleteInquiry(@RequestParam("qnaNo") Long qnaNo) {
		String str = "";
		if(qnaNo != null) {
			qnaRepository.deleteById(qnaNo);
			str = "성공적으로 삭제 되었습니다.";
		}else {
			str = "삭제에 실패했습니다. 인증이 유효한지 확인해주세요.";
		}
		
		return str;
	}
	
	
	
	
}
