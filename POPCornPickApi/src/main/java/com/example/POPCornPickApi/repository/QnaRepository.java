package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.Qna;

public interface QnaRepository extends JpaRepository<Qna, Long>{

	public List<Qna> findByQnaNo(Qna qnaNo);
}
