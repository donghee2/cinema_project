package com.example.cinema.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.cinema.dto.MemberDTO;
import com.example.cinema.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public MemberDTO login(String userEmail, String userPasswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userPasswd", userPasswd);
		return mapper.login(map);
	}

	public int insertMember(MemberDTO dto) {
		return mapper.insertMember(dto);
	}

	public int updateMember(String userEmail) {
		return mapper.updateMember(userEmail);
	}

	public int deleteMamber(String userEmail, String userPasswd) {
		return mapper.deleteMember(userEmail, userPasswd);
	}

	public MemberDTO selectUserEmail(String userName, int userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserEmail(map);
	}

	public MemberDTO selectUserPasswd(String userEmail, String userName, int userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserPasswd(map);
	}




	
	
}
