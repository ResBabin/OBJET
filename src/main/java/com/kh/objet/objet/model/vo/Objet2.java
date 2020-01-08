package com.kh.objet.objet.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Objet2 implements Serializable{

	private static final long serialVersionUID = -7125387838181514840L;
	
	private int objetno;
	private String userid;
	private String objettitle;
	private String objetintro;
	private String originmainposter;
	private String renamemainposter;
	private Date objetstartdate;
	private Date objetenddate;
	private String objettag;
	private String publicyn;
	private Date objetregidate;
	private String objetstatus;
	private int objetview;
	private int likecount;
	private int reviewcount;
	
	public Objet2() {}

	public Objet2(int objetno, String userid, String objettitle, String objetintro, String originmainposter,
			String renamemainposter, Date objetstartdate, Date objetenddate, String objettag, String publicyn,
			Date objetregidate, String objetstatus, int objetview, int likecount, int reviewcount) {
		super();
		this.objetno = objetno;
		this.userid = userid;
		this.objettitle = objettitle;
		this.objetintro = objetintro;
		this.originmainposter = originmainposter;
		this.renamemainposter = renamemainposter;
		this.objetstartdate = objetstartdate;
		this.objetenddate = objetenddate;
		this.objettag = objettag;
		this.publicyn = publicyn;
		this.objetregidate = objetregidate;
		this.objetstatus = objetstatus;
		this.objetview = objetview;
		this.likecount = likecount;
		this.reviewcount = reviewcount;
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

	public String getObjettitle() {
		return objettitle;
	}

	public void setObjettitle(String objettitle) {
		this.objettitle = objettitle;
	}

	public String getObjetintro() {
		return objetintro;
	}

	public void setObjetintro(String objetintro) {
		this.objetintro = objetintro;
	}

	public String getOriginmainposter() {
		return originmainposter;
	}

	public void setOriginmainposter(String originmainposter) {
		this.originmainposter = originmainposter;
	}

	public String getRenamemainposter() {
		return renamemainposter;
	}

	public void setRenamemainposter(String renamemainposter) {
		this.renamemainposter = renamemainposter;
	}

	public Date getObjetstartdate() {
		return objetstartdate;
	}

	public void setObjetstartdate(Date objetstartdate) {
		this.objetstartdate = objetstartdate;
	}

	public Date getObjetenddate() {
		return objetenddate;
	}

	public void setObjetenddate(Date objetenddate) {
		this.objetenddate = objetenddate;
	}

	public String getObjettag() {
		return objettag;
	}

	public void setObjettag(String objettag) {
		this.objettag = objettag;
	}

	public String getPublicyn() {
		return publicyn;
	}

	public void setPublicyn(String publicyn) {
		this.publicyn = publicyn;
	}

	public Date getObjetregidate() {
		return objetregidate;
	}

	public void setObjetregidate(Date objetregidate) {
		this.objetregidate = objetregidate;
	}

	public String getObjetstatus() {
		return objetstatus;
	}

	public void setObjetstatus(String objetstatus) {
		this.objetstatus = objetstatus;
	}

	public int getObjetview() {
		return objetview;
	}

	public void setObjetview(int objetview) {
		this.objetview = objetview;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getReviewcount() {
		return reviewcount;
	}

	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Objet2 [objetno=" + objetno + ", userid=" + userid + ", objettitle=" + objettitle + ", objetintro="
				+ objetintro + ", originmainposter=" + originmainposter + ", renamemainposter=" + renamemainposter
				+ ", objetstartdate=" + objetstartdate + ", objetenddate=" + objetenddate + ", objettag=" + objettag
				+ ", publicyn=" + publicyn + ", objetregidate=" + objetregidate + ", objetstatus=" + objetstatus
				+ ", objetview=" + objetview + ", likecount=" + likecount + ", reviewcount=" + reviewcount + "]";
	}
	
	

}
