package com.cinema.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cinema.dto.CinemaDTO;
import com.cinema.mapper.CinemaMapper;


@Service
public class CinemaService {
	private CinemaMapper mapper;
	
	public CinemaService(CinemaMapper mapper) {
		this.mapper = mapper;
	}

	public List<CinemaDTO> selectCinemaList() {
		return mapper.selectCinemaList();
	}

	
}
