package com.kh.objet.objet.model.vo;

public class ReviewKey implements java.io.Serializable{

	private static final long serialVersionUID = 10002L;
	
	private int objetno;
	private String userid;
	private String order;
	
	public ReviewKey() {}

	public ReviewKey(int objetno, String userid, String order) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.order = order;
	}
	
	public ReviewKey(int objetno, String order) {
		super();
		this.objetno = objetno;
		this.order = order;
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

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "ReviewKey [objetno=" + objetno + ", userid=" + userid + ", order=" + order + "]";
	}
	
	

	
	

	
}
