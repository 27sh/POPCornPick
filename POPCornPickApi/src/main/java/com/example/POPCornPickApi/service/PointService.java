package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Point;
import com.example.POPCornPickApi.repository.PointRepository;

@Service
public class PointService {

	@Autowired
	private PointRepository pointRepository;
	
	public int getTotalPoints(String username) {
        List<Point> points = pointRepository.findByMemberUsername(username);
        int totalAchieved = points.stream().mapToInt(Point::getAcheive).sum();
        int totalUsed = points.stream().mapToInt(Point::getPointUse).sum();
        return totalAchieved - totalUsed;
    }
}
