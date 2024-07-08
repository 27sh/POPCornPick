package com.example.POPCornPickApi.controller.sh27;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.repository.MemberRepository;
import com.example.POPCornPickApi.service.CouponService;
import com.example.POPCornPickApi.service.ExpCinemaService;
import com.example.POPCornPickApi.service.GiftCardService;
import com.example.POPCornPickApi.service.PointService;

@RestController
@RequestMapping("/api/v1/myPage")
public class MyPageController {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	GiftCardService giftCardService;
	
	@Autowired
	PointService pointService;
	
	@Autowired
	ExpCinemaService expCinemaService;
	
	@GetMapping("/info")
    public Map<String, Object> getMemberInfo(@RequestHeader("Authorization") String token) {
        // Assuming you have a method to extract username from token
        String username = extractUsernameFromToken(token);

        int couponCount = couponService.getCouponCount(username);
        int giftCardCount = giftCardService.getGiftCardCount(username);
        int totalPoints = pointService.getTotalPoints(username);
        List<ExpCinema> favoriteCinemas = expCinemaService.getFavoriteCinemas(username);

        Map<String, Object> response = new HashMap<>();
        response.put("couponCount", couponCount);
        response.put("giftCardCount", giftCardCount);
        response.put("totalPoints", totalPoints);
        response.put("favoriteCinemas", favoriteCinemas);

        return response;
    }

    private String extractUsernameFromToken(String token) {
        // Logic to extract username from token
        return "ghdrlfehd"; // Replace with actual extraction logic
    }
}
