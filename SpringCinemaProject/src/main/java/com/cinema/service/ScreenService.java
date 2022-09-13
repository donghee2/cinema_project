package com.cinema.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cinema.dto.ScreenDTO;
import com.cinema.mapper.ScreenMapper;


@Service
public class ScreenService {
	private ScreenMapper mapper;
	
	public ScreenService(ScreenMapper mapper) {
		this.mapper = mapper;
	}

	public List<ScreenDTO> selectScreenList(String mcode, String sdate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mcode", mcode);
		map.put("sdate", sdate);
		return mapper.selectScreenList(map);
	}

	
}
