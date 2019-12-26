package com.kh.objet.quit.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Quit2 implements Serializable {

	private static final long serialVersionUID = 22200L;
	
	private String userid;
	private String quittype;
	private String quitreason;
	private String quitreasonDetail;
	private Date quitdate;
	
	public Quit2() {}

	public Quit2(String userid, String quittype, String quitreason, String quitreasonDetail, Date quitdate) {
		super();
		this.userid = userid;
		this.quittype = quittype;
		this.quitreason = quitreason;
		this.quitreasonDetail = quitreasonDetail;
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

	public String getQuitreasonDetail() {
		return quitreasonDetail;
	}

	public void setQuitreasonDetail(String quitreasonDetail) {
		this.quitreasonDetail = quitreasonDetail;
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
		return "Quit2 [userid=" + userid + ", quittype=" + quittype + ", quitreason=" + quitreason
				+ ", quitreasonDetail=" + quitreasonDetail + ", quitdate=" + quitdate + "]";
	}

	
	
	

}
