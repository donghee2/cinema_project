package com.cinema.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cinema.dto.TheaterDTO;
import com.cinema.mapper.TheaterMapper;

@Service
public class TheaterService {
	private TheaterMapper mapper;
	
	public TheaterService(TheaterMapper mapper) {
		this.mapper = mapper;
	}

	public List<TheaterDTO> selectMovieScheduleList(String cno, String sdate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("sdate", sdate);
		
		return mapper.selectMovieScheduleList(map);
	}

	public int insertReservation(String seat, String id, String sno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seat", seat);
		map.put("id", id);
		map.put("sno", sno);
		
		return mapper.insertReservation(map);
	}

	public TheaterDTO selectSeat(String sno) {
		return mapper.selectSeat(sno);
	}
	
}
