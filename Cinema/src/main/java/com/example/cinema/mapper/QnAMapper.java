package com.example.cinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cinema.dto.QnADTO;

@Mapper
public interface QnAMapper {

	int insertQnA(QnADTO dto);
	
}
