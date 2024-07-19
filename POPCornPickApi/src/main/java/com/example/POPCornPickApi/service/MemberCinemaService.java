package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.CinemaRepository;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;
import com.example.POPCornPickApi.repository.UnknownMemberRepository;

@Service
public class MemberCinemaService {

    private final CinemaRepository cinemaRepository;
    private final ExpCinemaRepository expCinemaRepository;

    public MemberCinemaService(CinemaRepository cinemaRepository, ExpCinemaRepository expCinemaRepository, UnknownMemberRepository unknownMemberRepository) {
        this.cinemaRepository = cinemaRepository;
        this.expCinemaRepository = expCinemaRepository;
    }

    @Transactional
    public void saveFavoriteCinemas(String username, List<String> cinemaNames) {
        // 기존 즐겨찾기 삭제
        expCinemaRepository.deleteByMember_Username(username);

        // cinemaName 리스트로 cinemaNo 리스트를 가져옴
        List<Long> cinemaNos = cinemaRepository.findCinemaNosByCinemaNames(cinemaNames);
        
        // 새로운 즐겨찾기 저장
        List<Cinema> cinemas = cinemaRepository.findAllById(cinemaNos);
        List<ExpCinema> newExpCinemas = cinemas.stream()
                .map(cinema -> new ExpCinema(null, new Member(username), cinema))
                .collect(Collectors.toList());
        expCinemaRepository.saveAll(newExpCinemas);
    }

}
