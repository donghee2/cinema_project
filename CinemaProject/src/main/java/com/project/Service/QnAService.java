package com.project.Service;

import java.util.HashMap;
import java.util.List;

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

	public List<QnADTO> selectQna(String userEmail, int pageNo) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("userEmail", userEmail);
		map.put("pageNo", pageNo);
		return mapper.selectQna(map);
	}

	public int countQna(String userEmail) {
		return mapper.countQna(userEmail);
	}
	
	
	
}
