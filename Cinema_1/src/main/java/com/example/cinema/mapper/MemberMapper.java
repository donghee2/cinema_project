package com.example.cinema.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.cinema.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	// 로그인
	MemberDTO login(Map<String, Object> map);
	// 회원가입
	int insertMember(MemberDTO dto);
	// 회원정보수정
	int updateMember(String userEmail);
	// 회원탈퇴
	int deleteMember(String userEmail, String userPasswd);
	
}
