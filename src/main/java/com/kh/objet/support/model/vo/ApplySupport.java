package com.kh.objet.support.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ApplySupport implements Serializable{

	private static final long serialVersionUID = -1763895110092772397L;
	
	private String artistid;
	private String sptheader;
	private String sptintro;
	private String sptbank;
	private String sptaccount;
	private String thanksmsg;
	private Date sptapplydate;
	private Date sptmodifydate;
	
	public ApplySupport() {}

	public ApplySupport(String artistid, String sptheader, String sptintro, String sptbank, String sptaccount,
			String thanksmsg, Date sptapplydate, Date sptmodifydate) {
		super();
		this.artistid = artistid;
		this.sptheader = sptheader;
		this.sptintro = sptintro;
		this.sptbank = sptbank;
		this.sptaccount = sptaccount;
		this.thanksmsg = thanksmsg;
		this.sptapplydate = sptapplydate;
		this.sptmodifydate = sptmodifydate;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public String getSptheader() {
		return sptheader;
	}

	public void setSptheader(String sptheader) {
		this.sptheader = sptheader;
	}

	public String getSptintro() {
		return sptintro;
	}

	public void setSptintro(String sptintro) {
		this.sptintro = sptintro;
	}

	public String getSptbank() {
		return sptbank;
	}

	public void setSptbank(String sptbank) {
		this.sptbank = sptbank;
	}

	public String getSptaccount() {
		return sptaccount;
	}

	public void setSptaccount(String sptaccount) {
		this.sptaccount = sptaccount;
	}

	public String getThanksmsg() {
		return thanksmsg;
	}

	public void setThanksmsg(String thanksmsg) {
		this.thanksmsg = thanksmsg;
	}

	public Date getSptapplydate() {
		return sptapplydate;
	}

	public void setSptapplydate(Date sptapplydate) {
		this.sptapplydate = sptapplydate;
	}

	public Date getSptmodifydate() {
		return sptmodifydate;
	}

	public void setSptmodifydate(Date sptmodifydate) {
		this.sptmodifydate = sptmodifydate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ApplySupport [artistid=" + artistid + ", sptheader=" + sptheader + ", sptintro=" + sptintro
				+ ", sptbank=" + sptbank + ", sptaccount=" + sptaccount + ", thanksmsg=" + thanksmsg + ", sptapplydate="
				+ sptapplydate + ", sptmodifydate=" + sptmodifydate + "]";
	}

	
	
	
}
