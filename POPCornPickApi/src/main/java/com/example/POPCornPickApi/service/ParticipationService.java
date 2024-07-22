package com.example.POPCornPickApi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.entity.Participation;
import com.example.POPCornPickApi.repository.ParticipationRepository;

@Service
public class ParticipationService {

	@Autowired
	private ParticipationRepository participationRepository;
	
	public boolean memberEventForm(Participation participation) {
		try {
			participationRepository.save(participation);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Participation> memberParticipationList(){
		return participationRepository.findAll();
	}
	
}
