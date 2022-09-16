package com.project.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

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

	public int updateMember(MemberDTO dto) {
		return mapper.updateMember(dto);
	}

	public int deleteMamber(String userEmail, String userPasswd) {
		return mapper.deleteMember(userEmail, userPasswd);
	}

	public List<MemberDTO> selectUserEmail(String userName, int userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserEmail(map);
	}

	public List<MemberDTO> selectUserPasswd(String userEmail, String userName, int userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserPasswd(map);
	}

	public int updatePasswd(String userEmail, String userPasswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userPasswd", userPasswd);
		return mapper.updatePasswd(map);
	}

	public List<MemberDTO> selectAllMember() {
		return mapper.selectAllMember();
	}





	
	
}
