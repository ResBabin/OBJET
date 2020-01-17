package com.kh.objet.support.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MySupport implements Serializable{
	private static final long serialVersionUID = 2664045456129135218L;
	
	private String sptno;
	private String sptid;
	private String sptnickname;
	private String artistid;
	private String artistnickname;
	private int sptamount;
	private String sptcomment;
	private Date sptdate;
	
	public MySupport() {}

	public MySupport(String sptno, String sptid, String sptnickname, String artistid, String artistnickname,
			int sptamount, String sptcomment, Date sptdate) {
		super();
		this.sptno = sptno;
		this.sptid = sptid;
		this.sptnickname = sptnickname;
		this.artistid = artistid;
		this.artistnickname = artistnickname;
		this.sptamount = sptamount;
		this.sptcomment = sptcomment;
		this.sptdate = sptdate;
	}

	public String getSptno() {
		return sptno;
	}

	public void setSptno(String sptno) {
		this.sptno = sptno;
	}

	public String getSptid() {
		return sptid;
	}

	public void setSptid(String sptid) {
		this.sptid = sptid;
	}

	public String getSptnickname() {
		return sptnickname;
	}

	public void setSptnickname(String sptnickname) {
		this.sptnickname = sptnickname;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public String getArtistnickname() {
		return artistnickname;
	}

	public void setArtistnickname(String artistnickname) {
		this.artistnickname = artistnickname;
	}

	public int getSptamount() {
		return sptamount;
	}

	public void setSptamount(int sptamount) {
		this.sptamount = sptamount;
	}

	public String getSptcomment() {
		return sptcomment;
	}

	public void setSptcomment(String sptcomment) {
		this.sptcomment = sptcomment;
	}

	public Date getSptdate() {
		return sptdate;
	}

	public void setSptdate(Date sptdate) {
		this.sptdate = sptdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MySupport [sptno=" + sptno + ", sptid=" + sptid + ", sptnickname=" + sptnickname + ", artistid="
				+ artistid + ", artistnickname=" + artistnickname + ", sptamount=" + sptamount + ", sptcomment="
				+ sptcomment + ", sptdate=" + sptdate + "]";
	}

	
	
}
