package com.cinema.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cinema.dto.ScreenDTO;


@Mapper
public interface ScreenMapper {

	List<ScreenDTO> selectScreenList(Map<String, String> map);

}
