package com.example.cinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cinema.dto.GuestDTO;

@Mapper
public interface GuestMapper {

	int insertGuest(GuestDTO ndto);

	GuestDTO guestLogin(GuestDTO ndto);

}
