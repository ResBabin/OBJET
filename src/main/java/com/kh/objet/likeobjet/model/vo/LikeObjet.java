package com.kh.objet.likeobjet.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class LikeObjet implements Serializable {

	private static final long serialVersionUID = 8000L;
	
	private int objetno;
	private String userid;
	private Date likedate;
	private String objettitle;
	private Date objetstartdate;
	private Date objetenddate;
	private String objetcolor;
	
	public LikeObjet() {}

	public LikeObjet(String objettitle, Date objetstartdate, Date objetenddate, String objetcolor) {
		super();
		this.objettitle = objettitle;
		this.objetstartdate = objetstartdate;
		this.objetenddate = objetenddate;
		this.objetcolor = objetcolor;
	}

	public LikeObjet(int objetno, String userid, Date likedate) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.likedate = likedate;
	}
	
	public LikeObjet(int objetno, String userid) {
		super();
		this.objetno = objetno;
		this.userid = userid;
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

	public Date getLikedate() {
		return likedate;
	}

	public void setLikedate(Date likedate) {
		this.likedate = likedate;
	}

	public String getObjettitle() {
		return objettitle;
	}

	public void setObjettitle(String objettitle) {
		this.objettitle = objettitle;
	}

	public Date getObjetstartdate() {
		return objetstartdate;
	}


	public void setObjetstartdate(Date objetstartdate) {
		this.objetstartdate = objetstartdate;
	}


	public Date getObjetenddate() {
		return objetenddate;
	}


	public void setObjetenddate(Date objetenddate) {
		this.objetenddate = objetenddate;
	}

	public String getObjetcolor() {
		return objetcolor;
	}

	public void setObjetcolor(String objetcolor) {
		this.objetcolor = objetcolor;
	}

	@Override
	public String toString() {
		return "LikeObjet [objetno=" + objetno + ", userid=" + userid + ", likedate=" + likedate + ", objettitle="
				+ objettitle + ", objetstartdate=" + objetstartdate + ", objetenddate=" + objetenddate + ", objetcolor="
				+ objetcolor + "]";
	}

	
	

	
	
	

}
