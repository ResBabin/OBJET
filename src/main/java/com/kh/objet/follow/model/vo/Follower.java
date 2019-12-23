package com.kh.objet.follow.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Follower implements Serializable{
	private static final long serialVersionUID = 4000L;
	
	private String to_user;
	private String from_user;
	private Date followdate;
	
	public Follower () {}

	public Follower(String to_user, String from_user, Date followdate) {
		super();
		this.to_user = to_user;
		this.from_user = from_user;
		this.followdate = followdate;
	}

	public String getTo_user() {
		return to_user;
	}

	public void setTo_user(String to_user) {
		this.to_user = to_user;
	}

	public String getFrom_user() {
		return from_user;
	}

	public void setFrom_user(String from_user) {
		this.from_user = from_user;
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
		return "Follower [to_user=" + to_user + ", from_user=" + from_user + ", followdate=" + followdate + "]";
	}
	
	


}
