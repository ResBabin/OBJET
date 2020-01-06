package com.kh.objet.objet.model.vo;

public class ReviewUp implements java.io.Serializable{

	private static final long serialVersionUID = 10003L;

	private String userid;
	private String revcontent;
	private int revstars;
	
	public ReviewUp() {}

	public ReviewUp(String userid, String revcontent, int revstars) {
		super();
		this.userid = userid;
		this.revcontent = revcontent;
		this.revstars = revstars;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	@Override
	public String toString() {
		return "ReviewUp [userid=" + userid + ", revcontent=" + revcontent + ", revstars=" + revstars + "]";
	}
	
	
	
}
