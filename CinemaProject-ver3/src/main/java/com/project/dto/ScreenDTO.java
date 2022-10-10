package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("screen")
public class ScreenDTO {
	private String screenCode;
	private String cinemaCode;
	private String cinemaName;
	private String screenName;
	private String seatType;
	private String seatCode;
	private int allseat;
	
	public ScreenDTO() {	}
	
	
	public String getSeatCode() {
		return seatCode;
	}

	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public int getAllseat() {
		return allseat;
	}

	public void setAllseat(int allseat) {
		this.allseat = allseat;
	}

	public String getScreenCode() {
		return screenCode;
	}

	public void setScreenCode(String screenCode) {
		this.screenCode = screenCode;
	}

	public String getCinemaCode() {
		return cinemaCode;
	}

	public void setCinemaCode(String cinemaCode) {
		this.cinemaCode = cinemaCode;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}


	@Override
	public String toString() {
		return "ScreenDTO [screenCode=" + screenCode + ", cinemaCode=" + cinemaCode + ", cinemaName=" + cinemaName
				+ ", screenName=" + screenName + ", seatType=" + seatType + ", seatCode=" + seatCode + ", allseat="
				+ allseat + "]";
	}

	

	
}