package com.example.POPCornPickApi.controller.sh27;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.dto.CustomUserDetails;
import com.example.POPCornPickApi.entity.Coupon;
import com.example.POPCornPickApi.entity.CouponType;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.GiftCard;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Point;
import com.example.POPCornPickApi.repository.CouponRepository;
import com.example.POPCornPickApi.repository.CouponTypeRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.GiftCardRepository;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.repository.PointRepository;
import com.example.POPCornPickApi.service.PointService;

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
	
	@Autowired
    private CouponTypeRepository couponTypeRepository;
	
	@Autowired
    private PointService pointService;
	
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
        return couponRepository.countByMemberUsernameAndModdateIsNull(username);
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
	
	@GetMapping("/having")
    public List<Object> getHavingItems(Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();

        List<Coupon> coupons = couponRepository.findByMemberUsername(username);
        List<GiftCard> giftCards = giftCardRepository.findByMemberUsername(username);

        return List.of(coupons, giftCards);
    }
	
	@PostMapping("/register")
    public String registerCoupon(@RequestParam("couponCode") String couponCode, Authentication authentication) {
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();

        Optional<CouponType> couponTypeOpt = couponTypeRepository.findByCouponNo(Long.parseLong(couponCode));
        if (couponTypeOpt.isEmpty()) {
            return "쿠폰이 존재하지 않습니다.";
        }

        CouponType couponType = couponTypeOpt.get();
        Member member = memberRepository.findByUsername(username);
        if (member == null) {
            return "회원이 존재하지 않습니다.";
        }

        Optional<Coupon> existingCoupon = couponRepository.findByMemberAndCouponNo(member, couponType);
        if (existingCoupon.isPresent()) {
            return "이미 등록한 쿠폰입니다.";
        }

        Coupon coupon = new Coupon();
        coupon.setMember(member);
        coupon.setCouponNo(couponType);
        couponRepository.save(coupon);

        return "쿠폰이 성공적으로 등록되었습니다.";
    }
	
	@GetMapping("/points")
	public ResponseEntity<List<Point>> getPoints(@AuthenticationPrincipal UserDetails userDetails) {
        String username = userDetails.getUsername();
        System.out.println("Received request to fetch points for user: " + username);

        List<Point> points = pointRepository.findByUsername(username);
        return ResponseEntity.ok(points);
    }
}
