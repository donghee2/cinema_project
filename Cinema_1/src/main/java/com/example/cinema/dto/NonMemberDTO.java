package com.example.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("nonmember")
public class NonMemberDTO {
	private String nEmail;
	private String nName;

	public NonMemberDTO(String nEmail, String nName) {
		this.nEmail = nEmail;
		this.nName = nName;
	}

	public String getnEmail() {
		return nEmail;
	}

	public void setnEmail(String nEmail) {
		this.nEmail = nEmail;
	}

	public String getnName() {
		return nName;
	}

	public void setnName(String nName) {
		this.nName = nName;
	}

	@Override
	public String toString() {
		return "NonMemberDTO [nEmail=" + nEmail + ", nName=" + nName + "]";
	}
	
	
}
