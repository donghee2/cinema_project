package com.project.Service;

import org.springframework.stereotype.Service;

import com.project.dto.QnADTO;
import com.project.mapper.QnAMapper;

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
