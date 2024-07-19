package com.example.POPCornPickApi.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.GiftCard;

public interface GiftCardRepository extends JpaRepository<GiftCard, Long>{

	List<GiftCard> findByMemberUsername(String username);
	
	public List<GiftCard> findByMember_UsernameAndProduct_ProductTypeAndProduct_ProductEndDateAfterOrderByProduct_ProductEndDateAsc(String username, String productType, LocalDate currentDate);
	
	@Query("SELECT COUNT(g) FROM GiftCard g WHERE g.member.username = :username")
    int countByMemberUsername(@Param("username") String username);

}
