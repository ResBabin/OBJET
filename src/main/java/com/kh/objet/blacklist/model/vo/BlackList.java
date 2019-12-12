package com.kh.objet.blacklist.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BlackList implements Serializable{
	private static final long serialVersionUID = 1000L;
	
	
	private String userid;
	private Date blackstart;
	private Date blackend;
	private String blackreason;
	
	public BlackList() {}

	public BlackList(String userid, Date blackstart, Date blackend, String blackreason) {
		super();
		this.userid = userid;
		this.blackstart = blackstart;
		this.blackend = blackend;
		this.blackreason = blackreason;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getBlackstart() {
		return blackstart;
	}

	public void setBlackstart(Date blackstart) {
		this.blackstart = blackstart;
	}

	public Date getBlackend() {
		return blackend;
	}

	public void setBlackend(Date blackend) {
		this.blackend = blackend;
	}

	public String getBlackreason() {
		return blackreason;
	}

	public void setBlackreason(String blackreason) {
		this.blackreason = blackreason;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BlackList [userid=" + userid + ", blackstart=" + blackstart + ", blackend=" + blackend
				+ ", blackreason=" + blackreason + "]";
	}

	
}
