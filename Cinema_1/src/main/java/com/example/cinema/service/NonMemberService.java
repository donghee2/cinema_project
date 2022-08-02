package com.example.cinema.service;

import org.springframework.stereotype.Service;

import com.example.cinema.dto.NonMemberDTO;
import com.example.cinema.mapper.NonMemberMapper;

@Service
public class NonMemberService {
	private NonMemberMapper nmapper;

	public NonMemberService(NonMemberMapper nmapper) {
		this.nmapper = nmapper;
	}

	public int insertNonMember(NonMemberDTO ndto) {
		return nmapper.insertNonMember(ndto);
	}

	public NonMemberDTO nonMemberLogin(NonMemberDTO ndto) {
		return nmapper.nonMemberLogin(ndto);
	}
	
	
}
