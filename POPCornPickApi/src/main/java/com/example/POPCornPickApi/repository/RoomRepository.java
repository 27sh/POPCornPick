package com.example.POPCornPickApi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.POPCornPickApi.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Long>{

	List<Room> findByRoomNo(Long roomNo);

	List<Room> findByCinema_CinemaNo(Long cinemaNo);

	@Query(value = "select COUNT(room_no) from room WHERE room_type_no = :roomTypeNo", nativeQuery = true)
	public int getCountByRoomTypeNo(@Param("roomTypeNo") Long roomTypeNo);
	public List<Room> findByRoomType_RoomTypeNoOrderByCinema_CinemaNameAsc(Long roomTypeNo);
	
	@Query("SELECT rt.smallType FROM Room r JOIN r.roomType rt JOIN MovieShowDetail msd ON msd.room.roomNo = r.roomNo WHERE msd.movie.title = :title")
    List<String> findSmallTypeByMovieTitle(@Param("title") String title);
	
	@Query("SELECT r.roomNo FROM Room r WHERE r.cinema.cinemaNo = :cinemaNo")
	public List<Long> findRoomNoByCinemaNo(@Param("cinemaNo") Long cinemaNo);
	
	@Query(value= "select * from room where room_no = :roomNo", nativeQuery = true)
	public List<Room> getRoomInfo(@Param("roomNo") Long roomNo);
	
	@Query("SELECT COUNT(r) FROM Room r WHERE r.cinema.cinemaNo = :cinemaNo")
	int countRoomsByCinemaNo(@Param("cinemaNo") Long cinemaNo);

	@Query("SELECT SUM(r.roomType.roomTotalRow * r.roomType.roomTotalColumn) FROM Room r WHERE r.cinema.cinemaNo = :cinemaNo")
	int sumSeatCountByCinemaNo(@Param("cinemaNo") Long cinemaNo);

}
