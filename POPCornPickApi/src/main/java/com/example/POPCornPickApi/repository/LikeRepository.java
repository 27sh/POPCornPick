package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Like;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.entity.Review;

public interface LikeRepository extends JpaRepository<Like, Long>{

	public Like findByMemberUsername(String username);
	
	List<Like> findByReviewReviewNo(Long reviewNo);
}
