package com.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("theater")
public class TheaterDTO {
	private String tno;
	private String cno;
	private String mno;
	private String sno;
	private String id;
	private String tname;
	private String mname;
	private String sdate;
	private String rdate;
	private String seat;
	private int seatx;
	private int seaty;
	private int sprice;

	public TheaterDTO(String sno, String tname, String mname, String sdate, int sprice) {
		super();
		this.sno = sno;
		this.tname = tname;
		this.mname = mname;
		this.sdate = sdate;
		this.sprice = sprice;
	}

	public TheaterDTO(String tname, int seatx, int seaty) {
		super();
		this.tname = tname;
		this.seatx = seatx;
		this.seaty = seaty;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public int getSeatx() {
		return seatx;
	}

	public void setSeatx(int seatx) {
		this.seatx = seatx;
	}

	public int getSeaty() {
		return seaty;
	}

	public void setSeaty(int seaty) {
		this.seaty = seaty;
	}

	public int getSprice() {
		return sprice;
	}

	public void setSprice(int sprice) {
		this.sprice = sprice;
	}

	@Override
	public String toString() {
		return "TheaterDTO [tno=" + tno + ", cno=" + cno + ", mno=" + mno + ", sno=" + sno + ", id=" + id + ", tname="
				+ tname + ", mname=" + mname + ", sdate=" + sdate + ", rdate=" + rdate + ", seat=" + seat + ", seatx="
				+ seatx + ", seaty=" + seaty + ", sprice=" + sprice + "]";
	}
	
	public String test() {
		return sno + tname + mname + sprice;
	}

	
	
	
}
