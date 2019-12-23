package com.kh.objet.notice.model.vo;

import java.sql.Date;

public class SearchDate implements java.io.Serializable {
	private final static long serialVersionUID = 9123L;
	private Date begin;
	private Date end;
	
	public SearchDate() {}

	public SearchDate(Date begin, Date end) {
		super();
		this.begin = begin;
		this.end = end;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return this.begin.toString() + ", " + this.end.toString();
	}
}

