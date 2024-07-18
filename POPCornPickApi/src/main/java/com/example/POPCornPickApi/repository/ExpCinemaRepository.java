package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.POPCornPickApi.entity.ExpCinema;

public interface ExpCinemaRepository extends JpaRepository<ExpCinema, Long>{
	
	List<ExpCinema> findByMemberUsername(String username);
	
	List<ExpCinema> findByMember_Username(String username);
	
	ExpCinema findByMemberUsernameAndCinemaCinemaNo(String username, Long cinemaNo);
	
	List<ExpCinema> findByMemberUsernameOrderByCinema_CinemaNameAsc(String username);

	public int countByMember_Username(String username);
}
