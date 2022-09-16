package com.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.QnADTO;

@Mapper
public interface QnAMapper {

	int insertQnA(QnADTO dto);
	
}
