package com.kh.objet.guestbook.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GbReply implements Serializable{

	private static final long serialVersionUID = 6000L;
	
	private int gbno;
	private String artistid;
	private String replycontent;
	private Date replydate;
	private String replyprivateyn;
	
	public GbReply() {}

	public GbReply(int gbno, String artistid, String replycontent, Date replydate, String replyprivateyn) {
		super();
		this.gbno = gbno;
		this.artistid = artistid;
		this.replycontent = replycontent;
		this.replydate = replydate;
		this.replyprivateyn = replyprivateyn;
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

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}

	public String getReplyprivateyn() {
		return replyprivateyn;
	}

	public void setReplyprivateyn(String replyprivateyn) {
		this.replyprivateyn = replyprivateyn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GbReply [gbno=" + gbno + ", artistid=" + artistid + ", replycontent=" + replycontent + ", replydate="
				+ replydate + ", replyprivateyn=" + replyprivateyn + "]";
	}

	
	
}
