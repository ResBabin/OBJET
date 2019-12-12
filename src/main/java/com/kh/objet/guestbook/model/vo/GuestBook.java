package com.kh.objet.guestbook.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GuestBook implements Serializable {

	private static final long serialVersionUID = 7000L;
	
	private int gbno;
	private String artistid;
	private String userid;
	private String gbcontent;
	private Date gbdate;
	private String privateyn;
	private String replyyn;
	private String reportstatus;
	
	public GuestBook() {}

	public GuestBook(int gbno, String artistid, String userid, String gbcontent, Date gbdate, String privateyn,
			String replyyn, String reportstatus) {
		super();
		this.gbno = gbno;
		this.artistid = artistid;
		this.userid = userid;
		this.gbcontent = gbcontent;
		this.gbdate = gbdate;
		this.privateyn = privateyn;
		this.replyyn = replyyn;
		this.reportstatus = reportstatus;
	}

	public int getGbno() {
		return gbno;
	}

	public void setGbno(int gbno) {
		this.gbno = gbno;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGbcontent() {
		return gbcontent;
	}

	public void setGbcontent(String gbcontent) {
		this.gbcontent = gbcontent;
	}

	public Date getGbdate() {
		return gbdate;
	}

	public void setGbdate(Date gbdate) {
		this.gbdate = gbdate;
	}

	public String getPrivateyn() {
		return privateyn;
	}

	public void setPrivateyn(String privateyn) {
		this.privateyn = privateyn;
	}

	public String getReplyyn() {
		return replyyn;
	}

	public void setReplyyn(String replyyn) {
		this.replyyn = replyyn;
	}

	public String getReportstatus() {
		return reportstatus;
	}

	public void setReportstatus(String reportstatus) {
		this.reportstatus = reportstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GuestBook [gbno=" + gbno + ", artistid=" + artistid + ", userid=" + userid + ", gbcontent=" + gbcontent
				+ ", gbdate=" + gbdate + ", privateyn=" + privateyn + ", replyyn=" + replyyn + ", reportstatus="
				+ reportstatus + "]";
	}
	
	

}
