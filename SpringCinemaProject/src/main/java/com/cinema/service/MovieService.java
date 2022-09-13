package com.cinema.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.cinema.dto.MovieDTO;
import com.cinema.mapper.MovieMapper;

@Service
public class MovieService {
	private MovieMapper mapper;
	
	public MovieService(MovieMapper mapper) {
		this.mapper = mapper;
	}

	public List<MovieDTO> selectAllMovieList() {
		return mapper.selectAllMovieList();
	}

}
