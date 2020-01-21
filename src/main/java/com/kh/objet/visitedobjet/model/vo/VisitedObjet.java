package com.kh.objet.visitedobjet.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class VisitedObjet implements Serializable {
	private static final long serialVersionUID = 18000L;
	
	private int objetno;
	private String userid;
	private Date visitdate;
	private String objettitle;
	private String objetcolor;
	
	public VisitedObjet() {}

	public VisitedObjet(int objetno, String userid, Date visitdate) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.visitdate = visitdate;
	}

	public VisitedObjet(Date visitdate, String objettitle, String objetcolor) {
		super();
		this.visitdate = visitdate;
		this.objettitle = objettitle;
		this.objetcolor = objetcolor;
	}

	public String getObjettitle() {
		return objettitle;
	}

	public void setObjettitle(String objettitle) {
		this.objettitle = objettitle;
	}

	public int getObjetno() {
		return objetno;
	}

	public void setObjetno(int objetno) {
		this.objetno = objetno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getVisitdate() {
		return visitdate;
	}

	public void setVisitdate(Date visitdate) {
		this.visitdate = visitdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getObjetcolor() {
		return objetcolor;
	}

	public void setObjetcolor(String objetcolor) {
		this.objetcolor = objetcolor;
	}

	@Override
	public String toString() {
		return "VisitedObjet [objetno=" + objetno + ", userid=" + userid + ", visitdate=" + visitdate + ", objettitle="
				+ objettitle + ", objetcolor=" + objetcolor + "]";
	}



	
	

}
