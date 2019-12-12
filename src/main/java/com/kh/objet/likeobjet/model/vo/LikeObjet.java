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
	
	public LikeObjet() {}

	public LikeObjet(int objetno, String userid, Date likedate) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.likedate = likedate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LikeObjet [objetno=" + objetno + ", userid=" + userid + ", likedate=" + likedate + "]";
	}
	
	

}
