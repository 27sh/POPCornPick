package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Cinema;

import jakarta.transaction.Transactional;
//극장
public interface CinemaRepository extends JpaRepository<Cinema, Long>{
	public List<Cinema> findByCinemaNo(Long cinemaNo);
	public List<Cinema> findByCinemaLocationOrderByCinemaNameAsc(String cinemaLocation);
	public int countByCinemaLocation(String cinemaLocation);
	
	@Modifying
	@Transactional
	@Query("UPDATE Cinema c SET c.cinemaAddr = :cinemaAddr, c.cinemaIntro = :cinemaIntro, c.cinemaLocation = :cinemaLocation, c.cinemaName = :cinemaName, c.cinemaTel = :cinemaTel WHERE c.cinemaNo = :cinemaNo")
	public int updateCinemaById(@Param("cinemaNo")Long cinemaNo, @Param("cinemaAddr")String cinemaAddr, @Param("cinemaIntro")String cinemaIntro, @Param("cinemaLocation")String cinemaLocation, @Param("cinemaName")String cinemaName, @Param("cinemaTel")String cinemaTel);

	@Query("select c from Cinema c where c.cinemaLocation = :cinemaLocation")
	public List<Cinema> findByCinemaLocation(@Param("cinemaLocation")String cinemaLocation);
	
	@Query("select c.cinemaNo from Cinema c where c.cinemaName = :cinemaName")
	public Long findByCinemaName(@Param("cinemaName") String cinemaName);
	
	@Query(value = "select cinema_name from cinema where cinema_no = :cinemaNo", nativeQuery = true)
	public String getCinemaName(@Param("cinemaNo") Long cinemaNo);
	
	@Query("SELECT c.cinemaNo FROM Cinema c WHERE c.cinemaName IN :cinemaNames")
    List<Long> findCinemaNosByCinemaNames(@Param("cinemaNames") List<String> cinemaNames);
	
	@Query(value = "SELECT cinema_name FROM Cinema WHERE cinema_location = :location", nativeQuery = true)
	public List<String> getCinemaNameListByLocation(@Param("location") String location);
	
//	@Query(value = "select count(*), cinema_location from cinema c group by cinema_location", nativeQuery = true)
//	public List<C>
	
	@Query(value = "SELECT * FROM Cinema WHERE cinema_No = :cinemaNo", nativeQuery = true)
	public Cinema getCinemaFindByCinemaNo(@Param("cinemaNo") Long cinemaNo);
	
	@Query(value = "SELECT c FROM Cinema c WHERE c.cinemaName LIKE :searchContent")
	public List<Cinema> getSearchCinemaList(@Param("searchContent") String searchContent);
	
	List<Cinema> findByCinemaLocationStartingWith(String location);
	
	List<Cinema> findByCinemaNoIn(List<Long> cinemaNos);
}