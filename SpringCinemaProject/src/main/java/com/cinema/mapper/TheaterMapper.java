package com.cinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cinema.dto.TheaterDTO;


@Mapper
public interface TheaterMapper {

	List<TheaterDTO> selectMovieScheduleList(Map<String, Object> map);

	int insertReservation(Map<String, Object> map);

	TheaterDTO selectSeat(String sno);

}
