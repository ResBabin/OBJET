package com.kh.objet.users.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class EnrollCount implements java.io.Serializable{
	private static final long serialVersionUID = 5757L;
	
	private int enrollcount;
	private String enrolldate;
	
	public EnrollCount() {}

	public EnrollCount(int enrollcount, String enrolldate) {
		super();
		this.enrollcount = enrollcount;
		this.enrolldate = enrolldate;
	}

	public int getEnrollcount() {
		return enrollcount;
	}

	public void setEnrollcount(int enrollcount) {
		this.enrollcount = enrollcount;
	}

	public String getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(String enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return enrollcount +"";
	}
	
	
	
	
}
