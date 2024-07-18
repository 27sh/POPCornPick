package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Cinema;
import com.example.POPCornPickApi.entity.ExpCinema;
import com.example.POPCornPickApi.entity.Member;
import com.example.POPCornPickApi.repository.ExpCinemaRepository;

@Service
public class ExpCinemaService {

	@Autowired
	private ExpCinemaRepository expCinemaRepository;
	
	@Autowired
    private CinemaService cinemaService;
	
	public List<ExpCinema> getFavoriteCinemas(String username) {
        return expCinemaRepository.findByMemberUsername(username);
    }
	
	public void insertExpCinema(String username, String cinemaName) {
        Cinema cinema = cinemaService.findCinemaByCinemaName(cinemaName);
        Member member = new Member();
        member.setUsername(username);

        ExpCinema expCinema = new ExpCinema();
        expCinema.setMember(member);
        expCinema.setCinema(cinema);
        expCinemaRepository.save(expCinema);
    }

    public void updateExpCinema(String username, String oldCinemaName, String newCinemaName) {
        Long oldCinemaNo = cinemaService.findCinemaNoByCinemaName(oldCinemaName);
        Cinema newCinema = cinemaService.findCinemaByCinemaName(newCinemaName);

        ExpCinema expCinema = expCinemaRepository.findByMemberUsernameAndCinemaCinemaNo(username, oldCinemaNo);
        expCinema.setCinema(newCinema);
        expCinemaRepository.save(expCinema);
    }

    public void deleteExpCinema(String username, String cinemaName) {
        Long cinemaNo = cinemaService.findCinemaNoByCinemaName(cinemaName);
        ExpCinema expCinema = expCinemaRepository.findByMemberUsernameAndCinemaCinemaNo(username, cinemaNo);
        expCinemaRepository.delete(expCinema);
    }
}
