package com.example.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String userEmail;
	private String userPasswd;
	private String userName;
	private String userNick;
	private int userTel;
	private String address;
	private int point;
	
	public MemberDTO(String userEmail, String userPasswd, String userName, String userNick, int userTel,
			String address) {
		super();
		this.userEmail = userEmail;
		this.userPasswd = userPasswd;
		this.userName = userName;
		this.userNick = userNick;
		this.userTel = userTel;
		this.address = address;
	}
	

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getUserTel() {
		return userTel;
	}

	public void setUserTel(int userTel) {
		this.userTel = userTel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberDTO [userEmail=" + userEmail + ", userPasswd=" + userPasswd + ", userName=" + userName
				+ ", userNick=" + userNick + ", userTel=" + userTel + ", address=" + address + ", point=" + point + "]";
	}
	
	
}
