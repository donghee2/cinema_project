package com.cinema.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cinema.dto.MovieDTO;



@Mapper
public interface MovieMapper {

	List<MovieDTO> selectAllMovieList();


}
