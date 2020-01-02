package com.kh.objet.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Review implements Serializable{
	private static final long serialVersionUID = 15000L;
	
	private String userid;
	private int objetno;
	private String revcontent;
	private int revstars;
	private int revgood;
	private int revhate;
	private Date revdate;
	private String userrpic;
	private String nickname;
	
	public Review() {}

	public Review(String userid, int objetno, String revcontent, int revstars, int revgood, int revhate, Date revdate,
			String userrpic, String nickname) {
		super();
		this.userid = userid;
		this.objetno = objetno;
		this.revcontent = revcontent;
		this.revstars = revstars;
		this.revgood = revgood;
		this.revhate = revhate;
		this.revdate = revdate;
		this.userrpic = userrpic;
		this.nickname = nickname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	@Override
	public String toString() {
		return "Review [userid=" + userid + ", objetno=" + objetno + ", revcontent=" + revcontent + ", revstars="
				+ revstars + ", revgood=" + revgood + ", revhate=" + revhate + ", revdate=" + revdate + ", userrpic="
				+ userrpic + ", nickname=" + nickname + "]";
	}

	
	
	
	

}
