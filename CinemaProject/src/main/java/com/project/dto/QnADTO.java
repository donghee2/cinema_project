package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnADTO {
	private int qno;
	private String qnaTitle;
	private String qnaArea;
	private String qnaWriter;
	private int qnaQuiryType;
	private String qnaContent;
	private String response;
	private String qnaDate;

	public QnADTO() {
	}
	
	
	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getResponse() {
		return response;
	}
	
	public void setResponse(String response) {
		this.response = response;
	}


	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaArea() {
		return qnaArea;
	}

	public void setQnaArea(String qnaArea) {
		this.qnaArea = qnaArea;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public int getQnaQuiryType() {
		return qnaQuiryType;
	}

	public void setQnaQuiryType(int qnaQuiryType) {
		this.qnaQuiryType = qnaQuiryType;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	@Override
	public String toString() {
		return "QnADTO [qno=" + qno + ", qnaTitle=" + qnaTitle + ", qnaArea=" + qnaArea + ", qnaWriter=" + qnaWriter
				+ ", qnaQuiryType=" + qnaQuiryType + ", qnaContent=" + qnaContent + "]";
	}

	

	
}
