package com.example.cinema.service;

import org.springframework.stereotype.Service;

import com.example.cinema.dto.QnADTO;
import com.example.cinema.mapper.QnAMapper;

@Service
public class QnAService {
	private QnAMapper mapper;

	public QnAService(QnAMapper mapper) {
		this.mapper = mapper;
	}

	public int insertQnA(QnADTO dto) {
		return mapper.insertQnA(dto);
	}
	
	
	
}
