package com.kh.objet.feed.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Feed implements Serializable{

	private static final long serialVersionUID = 3000L;
	
	private int feedno;
	private String artistid;
	private String userid;
	private String feedcontent;
	private Date feeddate;
	
	public Feed() {}

	public Feed(int feedno, String artistid, String userid, String feedcontent, Date feeddate) {
		super();
		this.feedno = feedno;
		this.artistid = artistid;
		this.userid = userid;
		this.feedcontent = feedcontent;
		this.feeddate = feeddate;
	}

	public int getFeedno() {
		return feedno;
	}

	public void setFeedno(int feedno) {
		this.feedno = feedno;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFeedcontent() {
		return feedcontent;
	}

	public void setFeedcontent(String feedcontent) {
		this.feedcontent = feedcontent;
	}

	public Date getFeeddate() {
		return feeddate;
	}

	public void setFeeddate(Date feeddate) {
		this.feeddate = feeddate;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Feed [feedno=" + feedno + ", artistid=" + artistid + ", userid=" + userid + ", feedcontent="
				+ feedcontent + ", feeddate=" + feeddate + "]";
	}

	
	
	

}
