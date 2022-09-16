package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	// 로그인
	MemberDTO login(Map<String, Object> map);
	// 회원가입
	int insertMember(MemberDTO dto);
	// 회원정보수정
	int updateMember(MemberDTO dto);
	// 회원탈퇴
	int deleteMember(String userEmail, String userPasswd);
	// 아이디찾기
	List<MemberDTO> selectUserEmail(Map<String, Object> map);
	// 비밀번호찾기
	List<MemberDTO> selectUserPasswd(Map<String, Object> map);
	// 비밀번호 변경
	int updatePasswd(Map<String, Object> map);
	// 회원정보 전체조회
	List<MemberDTO> selectAllMember();
	
}
