package com.kh.objet.review.model.vo;

import java.sql.Date;

public class ReviewStatus implements java.io.Serializable{

	private static final long serialVersionUID = 15001L;
	
	private String revuserid;
	private int objetno;
	private String revcontent;
	private String userid;
	private int revgood;
	private int revhate;
	private java.sql.Date revdate;
	
	public ReviewStatus() {}

	public ReviewStatus(String revuserid, int objetno, String revcontent, String userid, int revgood, int revhate,
			Date revdate) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
		this.revcontent = revcontent;
		this.userid = userid;
		this.revgood = revgood;
		this.revhate = revhate;
		this.revdate = revdate;
	}

	public ReviewStatus(int objetno, String userid) {
		super();
		this.objetno = objetno;
		this.userid = userid;
	}
	
	public ReviewStatus(String revuserid, int objetno, String userid) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
		this.userid = userid;
	}

	//좋아요/좋아요 취소 생성자
	public ReviewStatus(String revuserid, int objetno, String userid, int revgood) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
		this.userid = userid;
		this.revgood = revgood;
	}
	
	//싫어요/싫어요 취소 생성자
	public ReviewStatus(int revhate, int objetno, String userid, String revuserid) {
		super();
		this.revhate = revhate;
		this.objetno = objetno;
		this.userid = userid;
		this.revuserid = revuserid;
	}

	public ReviewStatus(String revuserid, int objetno, String userid, int revgood, int revhate) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
		this.userid = userid;
		this.revgood = revgood;
		this.revhate = revhate;
	}

	public String getRevuserid() {
		return revuserid;
	}

	public void setRevuserid(String revuserid) {
		this.revuserid = revuserid;
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

	public int getRevgood() {
		return revgood;
	}

	public void setRevgood(int revgood) {
		this.revgood = revgood;
	}

	public int getRevhate() {
		return revhate;
	}

	public void setRevhate(int revhate) {
		this.revhate = revhate;
	}
	
	public String getRevcontent() {
		return revcontent;
	}

	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}

	public java.sql.Date getRevdate() {
		return revdate;
	}

	public void setRevdate(java.sql.Date revdate) {
		this.revdate = revdate;
	}

	@Override
	public String toString() {
		return "ReviewStatus [revuserid=" + revuserid + ", objetno=" + objetno + ", revcontent=" + revcontent
				+ ", userid=" + userid + ", revgood=" + revgood + ", revhate=" + revhate + ", revdate=" + revdate + "]";
	}

	
	

}
