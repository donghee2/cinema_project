package com.example.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("guest")
public class GuestDTO {
	private String gEmail;
	private String gName;

	public GuestDTO(String gEmail, String gName) {
		this.gEmail = gEmail;
		this.gName = gName;
	}

	public String getgEmail() {
		return gEmail;
	}

	public void setgEmail(String gEmail) {
		this.gEmail = gEmail;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	@Override
	public String toString() {
		return "GuestDTO [gEmail=" + gEmail + ", gName=" + gName + "]";
	}

	
	
	
}
