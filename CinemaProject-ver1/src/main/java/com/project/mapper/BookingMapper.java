package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.BookingDTO;


@Mapper
public interface BookingMapper {

	List<BookingDTO> selectMovieList(Map<String, Object> map);
	
	String selectSeatType(String screenCode);

	int insertBooking(Map<String, Object> map);

	String selectSeatcode(Map<String, Object> map);
	
	String selectBookingcode(Map<String, Object> map);

	void insertBookedSeat(Map<String, Object> map);



}
