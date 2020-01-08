package com.kh.objet.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Review implements Serializable{
	private static final long serialVersionUID = 15000L;
	
	private String revuserid;
	private int objetno;
	private String revcontent;
	private int revstars;
	private Date revdate;
	private String userrpic;
	private String nickname;
	private int revgood;
	private int revhate;
	
	public Review() {}

	public Review(String revuserid, int objetno, String revcontent, int revstars, Date revdate, String userrpic,
			String nickname, int revgood, int revhate) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
		this.revcontent = revcontent;
		this.revstars = revstars;
		this.revdate = revdate;
		this.userrpic = userrpic;
		this.nickname = nickname;
		this.revgood = revgood;
		this.revhate = revhate;
	}

	public Review(int objetno, String revuserid, String revcontent, int revstars) {
		super();
		this.objetno = objetno;
		this.revuserid = revuserid;
		this.revcontent = revcontent;
		this.revstars = revstars;
	}
	
	public Review(String revuserid, int objetno) {
		super();
		this.revuserid = revuserid;
		this.objetno = objetno;
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

	public String getRevcontent() {
		return revcontent;
	}

	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}

	public int getRevstars() {
		return revstars;
	}

	public void setRevstars(int revstars) {
		this.revstars = revstars;
	}

	public Date getRevdate() {
		return revdate;
	}

	public void setRevdate(Date revdate) {
		this.revdate = revdate;
	}

	public String getUserrpic() {
		return userrpic;
	}

	public void setUserrpic(String userrpic) {
		this.userrpic = userrpic;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	@Override
	public String toString() {
		return "Review [revuserid=" + revuserid + ", objetno=" + objetno + ", revcontent=" + revcontent + ", revstars="
				+ revstars + ", revdate=" + revdate + ", userrpic=" + userrpic + ", nickname=" + nickname + ", revgood="
				+ revgood + ", revhate=" + revhate + "]";
	}

	
	

	

	

	
	
	
	

}
