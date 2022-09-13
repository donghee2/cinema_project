package com.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("booking")
public class BookingDTO {
	private String bookingCode;
	private String email;
	private String moiveDate;
	private String screenCode;
	private String screenName;
	private String movieCode;
	private String seatType;
	private String seatNo;
	private int totalPrice;
	
	private String timeCode;
	private String title;
	private String mcode;
	private String startTime;
	private String endTime;
	
	public BookingDTO() {
	}

	public BookingDTO(String bookingCode, String email, String moiveDate, String screenCode, String screenName,
			String movieCode, String seatType, String seatNo, int totalPrice, String timeCode, String title,
			String mcode, String startTime, String endTime) {
		super();
		this.bookingCode = bookingCode;
		this.email = email;
		this.moiveDate = moiveDate;
		this.screenCode = screenCode;
		this.screenName = screenName;
		this.movieCode = movieCode;
		this.seatType = seatType;
		this.seatNo = seatNo;
		this.totalPrice = totalPrice;
		this.timeCode = timeCode;
		this.title = title;
		this.mcode = mcode;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMoiveDate() {
		return moiveDate;
	}

	public void setMoiveDate(String moiveDate) {
		this.moiveDate = moiveDate;
	}

	public String getBookingCode() {
		return bookingCode;
	}
	
	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTimeCode() {
		return timeCode;
	}
	
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	
	public String getScreenCode() {
		return screenCode;
	}
	
	public void setScreenCode(String screenCode) {
		this.screenCode = screenCode;
	}
	
	public String getMovieCode() {
		return movieCode;
	}
	
	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}
	
	public String getSeatType() {
		return seatType;
	}
	
	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	
	public String getSeatNo() {
		return seatNo;
	}
	
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "BookingDTO [bookingCode=" + bookingCode + ", email=" + email + ", moiveDate=" + moiveDate
				+ ", screenCode=" + screenCode + ", screenName=" + screenName + ", movieCode=" + movieCode
				+ ", seatType=" + seatType + ", seatNo=" + seatNo + ", totalPrice=" + totalPrice + ", timeCode="
				+ timeCode + ", title=" + title + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	
}
