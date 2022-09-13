package com.cinema.dto;

import org.apache.ibatis.type.Alias;

@Alias("movie")
public class MovieDTO {
	private String mcode;
	private String title;
	private String titleeng;
	private String directornm;
	private String directorennm;
	private String actornm;
	private String actorennm;
	private String company;
	private String nation;
	private String genre;
	private String rating;
	private String runtime;
	private String reprlsdate;
	private String keywords;
	private String plottext;
	private String kmdburl;
	
	public MovieDTO() { }

	public MovieDTO(String mcode, String title, String titleeng, String directornm, String directorennm, String actornm,
			String actorennm, String company, String nation, String genre, String rating, String runtime,
			String reprlsdate, String keywords, String plottext, String kmdburl) {
		super();
		this.mcode = mcode;
		this.title = title;
		this.titleeng = titleeng;
		this.directornm = directornm;
		this.directorennm = directorennm;
		this.actornm = actornm;
		this.actorennm = actorennm;
		this.company = company;
		this.nation = nation;
		this.genre = genre;
		this.rating = rating;
		this.runtime = runtime;
		this.reprlsdate = reprlsdate;
		this.keywords = keywords;
		this.plottext = plottext;
		this.kmdburl = kmdburl;
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

	public String getTitleeng() {
		return titleeng;
	}

	public void setTitleeng(String titleeng) {
		this.titleeng = titleeng;
	}

	public String getDirectornm() {
		return directornm;
	}

	public void setDirectornm(String directornm) {
		this.directornm = directornm;
	}

	public String getDirectorennm() {
		return directorennm;
	}

	public void setDirectorennm(String directorennm) {
		this.directorennm = directorennm;
	}

	public String getActornm() {
		return actornm;
	}

	public void setActornm(String actornm) {
		this.actornm = actornm;
	}

	public String getActorennm() {
		return actorennm;
	}

	public void setActorennm(String actorennm) {
		this.actorennm = actorennm;
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

	public String getReprlsdate() {
		return reprlsdate;
	}

	public void setReprlsdate(String reprlsdate) {
		this.reprlsdate = reprlsdate;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getPlottext() {
		return plottext;
	}

	public void setPlottext(String plottext) {
		this.plottext = plottext;
	}

	public String getKmdburl() {
		return kmdburl;
	}

	public void setKmdburl(String kmdburl) {
		this.kmdburl = kmdburl;
	}

	@Override
	public String toString() {
		return "MovieDTO [mcode=" + mcode + ", title=" + title + ", titleeng=" + titleeng + ", directornm=" + directornm
				+ ", directorennm=" + directorennm + ", actornm=" + actornm + ", actorennm=" + actorennm + ", company="
				+ company + ", nation=" + nation + ", genre=" + genre + ", rating=" + rating + ", runtime=" + runtime
				+ ", reprlsdate=" + reprlsdate + ", keywords=" + keywords + ", plottext=" + plottext + ", kmdburl="
				+ kmdburl + "]";
	}
	
}