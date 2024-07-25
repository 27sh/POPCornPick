package com.example.POPCornPickApi.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.MovieShowDetail;

public interface MovieShowDetailRepository extends JpaRepository<MovieShowDetail, Long>{
	public MovieShowDetail findByDetailNo(Long detailNo);
	
	public List<MovieShowDetail> findByRoom_RoomNo(Long roomNo);

	@Query(value = "select detail_No from movie_show_detail WHERE movie_DC = :movieDC and room_No = :roomNo", nativeQuery = true)
	public Long findDetailNoByMovieDCAndRoomNo(@Param("movieDC") Long movieDC, @Param("roomNo") Long roomNo);
	
	public List<MovieShowDetail> findByMovie_MovieDC(Long movieDC);
	public List<MovieShowDetail> findByMovie_MovieDCAndRoom_RoomNo(Long movieDC, Long roomNo);
	
	List<MovieShowDetail> findByRoomRoomNoIn(List<Long> roomNos);
}
