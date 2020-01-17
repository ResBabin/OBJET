package com.kh.objet.support.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RequestSupport implements Serializable{

	private static final long serialVersionUID = -8838669502706053587L;
	
	private int requestno;
	private String artistid;
	private int requestyear;
	private int requestmonth;
	private Date sptdate;
	private String sptstatus;
	private Date sptdonedate;
	private String sptofile;
	private String sptrfile;
	private String adminid;
	private String adminmemo;
	
	private String sptbank;
	private String sptaccount;

	public RequestSupport() {}

	public RequestSupport(int requestno, String artistid, int requestyear, int requestmonth, Date sptdate,
			String sptstatus, Date sptdonedate, String sptofile, String sptrfile, String adminid, String adminmemo,
			String sptbank, String sptaccount) {
		super();
		this.requestno = requestno;
		this.artistid = artistid;
		this.requestyear = requestyear;
		this.requestmonth = requestmonth;
		this.sptdate = sptdate;
		this.sptstatus = sptstatus;
		this.sptdonedate = sptdonedate;
		this.sptofile = sptofile;
		this.sptrfile = sptrfile;
		this.adminid = adminid;
		this.adminmemo = adminmemo;
		this.sptbank = sptbank;
		this.sptaccount = sptaccount;
	}

	public int getRequestno() {
		return requestno;
	}

	public void setRequestno(int requestno) {
		this.requestno = requestno;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public int getRequestyear() {
		return requestyear;
	}

	public void setRequestyear(int requestyear) {
		this.requestyear = requestyear;
	}

	public int getRequestmonth() {
		return requestmonth;
	}

	public void setRequestmonth(int requestmonth) {
		this.requestmonth = requestmonth;
	}

	public Date getSptdate() {
		return sptdate;
	}

	public void setSptdate(Date sptdate) {
		this.sptdate = sptdate;
	}

	public String getSptstatus() {
		return sptstatus;
	}

	public void setSptstatus(String sptstatus) {
		this.sptstatus = sptstatus;
	}

	public Date getSptdonedate() {
		return sptdonedate;
	}

	public void setSptdonedate(Date sptdonedate) {
		this.sptdonedate = sptdonedate;
	}

	public String getSptofile() {
		return sptofile;
	}

	public void setSptofile(String sptofile) {
		this.sptofile = sptofile;
	}

	public String getSptrfile() {
		return sptrfile;
	}

	public void setSptrfile(String sptrfile) {
		this.sptrfile = sptrfile;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminmemo() {
		return adminmemo;
	}

	public void setAdminmemo(String adminmemo) {
		this.adminmemo = adminmemo;
	}

	public String getSptbank() {
		return sptbank;
	}

	public void setSptbank(String sptbank) {
		this.sptbank = sptbank;
	}

	public String getSptaccount() {
		return sptaccount;
	}

	public void setSptaccount(String sptaccount) {
		this.sptaccount = sptaccount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RequestSupport [requestno=" + requestno + ", artistid=" + artistid + ", requestyear=" + requestyear
				+ ", requestmonth=" + requestmonth + ", sptdate=" + sptdate + ", sptstatus=" + sptstatus
				+ ", sptdonedate=" + sptdonedate + ", sptofile=" + sptofile + ", sptrfile=" + sptrfile + ", adminid="
				+ adminid + ", adminmemo=" + adminmemo + ", sptbank=" + sptbank + ", sptaccount=" + sptaccount + "]";
	}

	
}
