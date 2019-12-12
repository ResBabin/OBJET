package com.kh.objet.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice implements Serializable{
	private static final long serialVersionUID = 9000L;
	
	private int noticeno;
	private String adminid;
	private String noticetype;
	private String noticetitle;
	private Date noticedate;
	private String noticecontent;
	private String noticeofile1;
	private String noticerfile1;
	private String noticeofile2;
	private String noticerfile2;
	private String noticeofile3;
	private String noticerfile3;
	
	public Notice() {}

	public Notice(int noticeno, String adminid, String noticetype, String noticetitle, Date noticedate,
			String noticecontent, String noticeofile1, String noticerfile1, String noticeofile2, String noticerfile2,
			String noticeofile3, String noticerfile3) {
		super();
		this.noticeno = noticeno;
		this.adminid = adminid;
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.noticedate = noticedate;
		this.noticecontent = noticecontent;
		this.noticeofile1 = noticeofile1;
		this.noticerfile1 = noticerfile1;
		this.noticeofile2 = noticeofile2;
		this.noticerfile2 = noticerfile2;
		this.noticeofile3 = noticeofile3;
		this.noticerfile3 = noticerfile3;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getNoticetype() {
		return noticetype;
	}

	public void setNoticetype(String noticetype) {
		this.noticetype = noticetype;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public Date getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public String getNoticeofile1() {
		return noticeofile1;
	}

	public void setNoticeofile1(String noticeofile1) {
		this.noticeofile1 = noticeofile1;
	}

	public String getNoticerfile1() {
		return noticerfile1;
	}

	public void setNoticerfile1(String noticerfile1) {
		this.noticerfile1 = noticerfile1;
	}

	public String getNoticeofile2() {
		return noticeofile2;
	}

	public void setNoticeofile2(String noticeofile2) {
		this.noticeofile2 = noticeofile2;
	}

	public String getNoticerfile2() {
		return noticerfile2;
	}

	public void setNoticerfile2(String noticerfile2) {
		this.noticerfile2 = noticerfile2;
	}

	public String getNoticeofile3() {
		return noticeofile3;
	}

	public void setNoticeofile3(String noticeofile3) {
		this.noticeofile3 = noticeofile3;
	}

	public String getNoticerfile3() {
		return noticerfile3;
	}

	public void setNoticerfile3(String noticerfile3) {
		this.noticerfile3 = noticerfile3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", adminid=" + adminid + ", noticetype=" + noticetype + ", noticetitle="
				+ noticetitle + ", noticecontent=" + noticecontent + ", noticeofile1=" + noticeofile1
				+ ", noticerfile1=" + noticerfile1 + ", noticeofile2=" + noticeofile2 + ", noticerfile2=" + noticerfile2
				+ ", noticeofile3=" + noticeofile3 + ", noticerfile3=" + noticerfile3 + "]";
	}
	
	
}
