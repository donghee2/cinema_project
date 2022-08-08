package com.cinema.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cinema.dto.CinemaDTO;


@Mapper
public interface CinemaMapper {

	List<CinemaDTO> selectCinemaList();

}
