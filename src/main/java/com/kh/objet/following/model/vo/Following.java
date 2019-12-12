package com.kh.objet.following.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Following implements Serializable{

	private static final long serialVersionUID = 5000L;
	
	private String from_user;
	private String to_user;
	private Date followdate;

	
	public Following() {}


	public Following(String from_user, String to_user, Date followdate) {
		super();
		this.from_user = from_user;
		this.to_user = to_user;
		this.followdate = followdate;
	}


	public String getFrom_user() {
		return from_user;
	}


	public void setFrom_user(String from_user) {
		this.from_user = from_user;
	}


	public String getTo_user() {
		return to_user;
	}


	public void setTo_user(String to_user) {
		this.to_user = to_user;
	}


	public Date getFollowdate() {
		return followdate;
	}


	public void setFollowdate(Date followdate) {
		this.followdate = followdate;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Following [from_user=" + from_user + ", to_user=" + to_user + ", followdate=" + followdate + "]";
	}
	
	
}
