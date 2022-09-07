package com.example.cinema.service;

import org.springframework.stereotype.Service;

import com.example.cinema.dto.GuestDTO;
import com.example.cinema.mapper.GuestMapper;

@Service
public class GuestService {
	private GuestMapper gmapper;

	public GuestService(GuestMapper gmapper) {
		this.gmapper = gmapper;
	}

	public int insertGuest(GuestDTO gdto) {
		return gmapper.insertGuest(gdto);
	}

	public GuestDTO guestLogin(GuestDTO gdto) {
		return gmapper.guestLogin(gdto);
	}
	
	
}
