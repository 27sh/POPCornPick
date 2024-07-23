package com.example.POPCornPickApi.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.POPCornPickApi.repository.TicketingRepository;

@Service
public class TicketingService {
	
	@Autowired
    private TicketingRepository ticketingRepository;

	public List<String> getTopMoviesByTicketCount() {
        List<Object[]> result = ticketingRepository.getTopMoviesByTicketCount();
        return result.stream()
                .map(record -> (String) record[0])
                .collect(Collectors.toList());
    }
}
