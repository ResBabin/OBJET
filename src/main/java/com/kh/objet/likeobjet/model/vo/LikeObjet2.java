package com.kh.objet.likeobjet.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class LikeObjet2 implements Serializable{
	private static final long serialVersionUID = 4131660450218891713L;
	
	private int objetno;
	private String userid;
	private Date visitdate;
	private String nickname;
	private String objettitle;
	private String objetstatus;
	private String renamemainposter;
	
	public LikeObjet2() {}

	public LikeObjet2(int objetno, String userid, Date visitdate, String nickname, String objettitle, 
			String objetstatus, String renamemainposter) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.visitdate = visitdate;
		this.nickname = nickname;
		this.objettitle = objettitle;
		this.objetstatus = objetstatus;
		this.renamemainposter = renamemainposter;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getObjettitle() {
		return objettitle;
	}

	public void setObjettitle(String objettitle) {
		this.objettitle = objettitle;
	}

	public String getObjetstatus() {
		return objetstatus;
	}

	public void setObjetstatus(String objetstatus) {
		this.objetstatus = objetstatus;
	}

	public String getRenamemainposter() {
		return renamemainposter;
	}

	public void setRenamemainposter(String renamemainposter) {
		this.renamemainposter = renamemainposter;
	}

	@Override
	public String toString() {
		return "VisitedObjet2 [objetno=" + objetno + ", userid=" + userid + ", visitdate=" + visitdate + ", nickname=" + nickname + 
				", objettitle=" + objettitle + ", objetstatus=" + objetstatus + ", renamemainposter="
				+ renamemainposter + "]";
	}
	
	
}
