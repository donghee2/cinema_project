package com.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("cinema")
public class CinemaDTO {
	private String cno;
	private String cname;
	
	public CinemaDTO() {	}

	public CinemaDTO(String cno, String cname) {
		super();
		this.cno = cno;
		this.cname = cname;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Override
	public String toString() {
		return "CinemaDTO [cno=" + cno + ", cname=" + cname + "]";
	}

}