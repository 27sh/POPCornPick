package com.example.POPCornPickApi.controller.sh27;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.CustomUserDetails;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.CouponRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.GiftCardRepository;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.PointRepository;

@RestController
@RequestMapping("/api/v1/myPage")
public class MyPageController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
    CouponRepository couponRepository;
	
	@Autowired
    GiftCardRepository giftCardRepository;
	
	@Autowired
    PointRepository pointRepository;
	
	@Autowired
    ExpCinemaRepository expCinemaRepository;
	
	@GetMapping("/info")
    public Member getUserInfo(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return memberRepository.findByUsername(username);
    }
	
	@GetMapping("/couponCount")
    public int getCouponCount(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return couponRepository.countByMemberUsername(username);
    }
	
	@GetMapping("/giftCardCount")
    public int getGiftCardCount(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return giftCardRepository.countByMemberUsername(username);
    }
	
	@GetMapping("/totalPoints")
    public int getTotalPoints(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        Integer totalPoints = pointRepository.findTotalPointsByUsername(username);
        return totalPoints != null ? totalPoints : 0; // null일 경우 0을 반환
    }
	
	@GetMapping("/expCinemas")
    public List<ExpCinema> getExpCinemas(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return expCinemaRepository.findByMemberUsername(username);
    }
}
