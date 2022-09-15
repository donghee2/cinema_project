package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("screen")
public class ScreenDTO {
	private String screencode;
	private String cinemacode;
	private String screenname;
	
	public ScreenDTO() {
		super();
	}
	public ScreenDTO(String screencode, String cinemacode, String screenname) {
		super();
		this.screencode = screencode;
		this.cinemacode = cinemacode;
		this.screenname = screenname;
	}
	public String getScreencode() {
		return screencode;
	}
	public void setScreencode(String screencode) {
		this.screencode = screencode;
	}
	public String getCinemacode() {
		return cinemacode;
	}
	public void setCinemacode(String cinemacode) {
		this.cinemacode = cinemacode;
	}
	public String getscreenname() {
		return screenname;
	}
	public void setscreenname(String screenname) {
		this.screenname = screenname;
	}
	@Override
	public String toString() {
		return "ScreenDTO [screencode=" + screencode + ", cinemacode=" + cinemacode + ", screenname=" + screenname + "]";
	}
	
}
