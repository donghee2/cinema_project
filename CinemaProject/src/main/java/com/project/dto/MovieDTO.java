package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("movie")
public class MovieDTO {
	private String mcode;
	private String title;
	private String titleEng;
	private String directorNm;
	private String directorEnNm;
	private String actorNm;
	private String actorEnNm;
	private String company;
	private String nation;
	private String genre;
	private String rating;
	private String runtime;
	private String repRlsDate;
	private String keywords;
	private String plotText;
	private String kmdbUrl;
	
	private String startdate;
	private String enddate;
	
	private String path;
	private String fileName;
	private String type;
	private int fno;
	

	public MovieDTO(String mcode, String title, String titleEng, String directorNm, String directorEnNm, String actorNm,
			String actorEnNm, String company, String nation, String genre, String rating, String runtime,
			String repRlsDate, String keywords, String plotText, String kmdbUrl, String startdate, String enddate,
			String path, String fileName, String type, int fno) {
		super();
		this.mcode = mcode;
		this.title = title;
		this.titleEng = titleEng;
		this.directorNm = directorNm;
		this.directorEnNm = directorEnNm;
		this.actorNm = actorNm;
		this.actorEnNm = actorEnNm;
		this.company = company;
		this.nation = nation;
		this.genre = genre;
		this.rating = rating;
		this.runtime = runtime;
		this.repRlsDate = repRlsDate;
		this.keywords = keywords;
		this.plotText = plotText;
		this.kmdbUrl = kmdbUrl;
		this.startdate = startdate;
		this.enddate = enddate;
		this.path = path;
		this.fileName = fileName;
		this.type = type;
		this.fno = fno;
	}

	public MovieDTO() {
		super();
	}
	
	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public MovieDTO(String mcode, String title, String titleEng, String directorNm, String directorEnNm, String actorNm,
			String actorEnNm, String company, String nation, String genre, String rating, String runtime,
			String repRlsDate, String keywords, String plotText, String kmdbUrl, String startdate, String enddate) {
		super();
		this.mcode = mcode;
		this.title = title;
		this.titleEng = titleEng;
		this.directorNm = directorNm;
		this.directorEnNm = directorEnNm;
		this.actorNm = actorNm;
		this.actorEnNm = actorEnNm;
		this.company = company;
		this.nation = nation;
		this.genre = genre;
		this.rating = rating;
		this.runtime = runtime;
		this.repRlsDate = repRlsDate;
		this.keywords = keywords;
		this.plotText = plotText;
		this.kmdbUrl = kmdbUrl;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public MovieDTO(String mcode, String title, String titleEng, String directorNm, String directorEnNm, String actorNm,
			String actorEnNm, String company, String nation, String genre, String rating, String runtime,
			String repRlsDate, String keywords, String plotText, String kmdbUrl) {
		super();
		this.mcode = mcode;
		this.title = title;
		this.titleEng = titleEng;
		this.directorNm = directorNm;
		this.directorEnNm = directorEnNm;
		this.actorNm = actorNm;
		this.actorEnNm = actorEnNm;
		this.company = company;
		this.nation = nation;
		this.genre = genre;
		this.rating = rating;
		this.runtime = runtime;
		this.repRlsDate = repRlsDate;
		this.keywords = keywords;
		this.plotText = plotText;
		this.kmdbUrl = kmdbUrl;
	}
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleEng() {
		return titleEng;
	}

	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}

	public String getDirectorNm() {
		return directorNm;
	}

	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}

	public String getDirectorEnNm() {
		return directorEnNm;
	}

	public void setDirectorEnNm(String directorEnNm) {
		this.directorEnNm = directorEnNm;
	}

	public String getActorNm() {
		return actorNm;
	}

	public void setActorNm(String actorNm) {
		this.actorNm = actorNm;
	}

	public String getActorEnNm() {
		return actorEnNm;
	}

	public void setActorEnNm(String actorEnNm) {
		this.actorEnNm = actorEnNm;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getRepRlsDate() {
		return repRlsDate;
	}

	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getPlotText() {
		return plotText;
	}

	public void setPlotText(String plotText) {
		this.plotText = plotText;
	}

	public String getKmdbUrl() {
		return kmdbUrl;
	}

	public void setKmdbUrl(String kmdbUrl) {
		this.kmdbUrl = kmdbUrl;
	}

	@Override
	public String toString() {
		return "MovieDTO [mcode=" + mcode + ", title=" + title + ", titleEng=" + titleEng + ", directorNm=" + directorNm
				+ ", directorEnNm=" + directorEnNm + ", actorNm=" + actorNm + ", actorEnNm=" + actorEnNm + ", company="
				+ company + ", nation=" + nation + ", genre=" + genre + ", rating=" + rating + ", runtime=" + runtime
				+ ", repRlsDate=" + repRlsDate + ", keywords=" + keywords + ", plotText=" + plotText + ", kmdbUrl="
				+ kmdbUrl + "]";
	}

	
	
	
}
