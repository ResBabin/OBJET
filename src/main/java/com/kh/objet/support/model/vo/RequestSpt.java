package com.kh.objet.support.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RequestSpt implements Serializable{

	private static final long serialVersionUID = -8838669502706053587L;
	
	private String artistid;
	private Date sptdate;
	private String sptstatus;
	private Date sptdonedate;
	private String sptfile;
	private String adminid;
	private String adminmemo;

	public RequestSpt() {}

	public RequestSpt(String artistid, Date sptdate, String sptstatus, Date sptdonedate, String sptfile, String adminid,
			String adminmemo) {
		super();
		this.artistid = artistid;
		this.sptdate = sptdate;
		this.sptstatus = sptstatus;
		this.sptdonedate = sptdonedate;
		this.sptfile = sptfile;
		this.adminid = adminid;
		this.adminmemo = adminmemo;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
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

	public String getSptfile() {
		return sptfile;
	}

	public void setSptfile(String sptfile) {
		this.sptfile = sptfile;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RequestSpt [artistid=" + artistid + ", sptdate=" + sptdate + ", sptstatus=" + sptstatus
				+ ", sptdonedate=" + sptdonedate + ", sptfile=" + sptfile + ", adminid=" + adminid + ", adminmemo="
				+ adminmemo + "]";
	}
	
	

}
