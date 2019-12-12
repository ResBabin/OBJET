package com.kh.objet.quit.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Quit implements Serializable {

	private static final long serialVersionUID = 12000L;
	
	private String userid;
	private String quittype;
	private String quitreason;
	private Date quitdate;
	
	public Quit() {}

	public Quit(String userid, String quittype, String quitreason, Date quitdate) {
		super();
		this.userid = userid;
		this.quittype = quittype;
		this.quitreason = quitreason;
		this.quitdate = quitdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getQuittype() {
		return quittype;
	}

	public void setQuittype(String quittype) {
		this.quittype = quittype;
	}

	public String getQuitreason() {
		return quitreason;
	}

	public void setQuitreason(String quitreason) {
		this.quitreason = quitreason;
	}

	public Date getQuitdate() {
		return quitdate;
	}

	public void setQuitdate(Date quitdate) {
		this.quitdate = quitdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Quit [userid=" + userid + ", quittype=" + quittype + ", quitreason=" + quitreason + ", quitdate="
				+ quitdate + "]";
	}
	
	

}
