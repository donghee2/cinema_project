package com.example.cinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cinema.dto.NonMemberDTO;

@Mapper
public interface NonMemberMapper {

	int insertNonMember(NonMemberDTO ndto);

	NonMemberDTO nonMemberLogin(NonMemberDTO ndto);

}
