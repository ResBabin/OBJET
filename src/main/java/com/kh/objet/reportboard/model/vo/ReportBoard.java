package com.kh.objet.reportboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Component
public class ReportBoard implements Serializable{

	private static final long serialVersionUID = 13000L;

	private int originno;
	private String reportedb;
	private String reporterb;
	private String reportbtype;
	private Date reportbdate;
	private String reportbreason;
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
	private String revcontent;
	private int revstars;
	private int revgood;
	private int revhate;
	private Date revdate;
	private int reportcount;
	
	public ReportBoard() {
	}
	
	
	
	public ReportBoard(int originno, String reportedb, String reporterb) {
		super();
		this.originno = originno;
		this.reportedb = reportedb;
		this.reporterb = reporterb;
	}



	public ReportBoard(int originno, String reportedb, String reporterb, String reportbtype, 	String reportbreason) {
		super();
		this.originno = originno;
		this.reportedb = reportedb;
		this.reporterb = reporterb;
		this.reportbtype = reportbtype;
		this.reportbreason = reportbreason;
	}



	public ReportBoard(int originno, String reportedb, String reporterb, String reportbtype, Date reportbdate,
			String reportbreason, int objetno, String userid, String objettitle, String objetintro,
			String originmainposter, String renamemainposter, Date objetstartdate, Date objetenddate, String objettag,
			String publicyn, Date objetregidate, String objetstatus, int objetview, String revcontent, int revstars,
			int revgood, int revhate, Date revdate, int reportcount) {
		super();
		this.originno = originno;
		this.reportedb = reportedb;
		this.reporterb = reporterb;
		this.reportbtype = reportbtype;
		this.reportbdate = reportbdate;
		this.reportbreason = reportbreason;
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
		this.revcontent = revcontent;
		this.revstars = revstars;
		this.revgood = revgood;
		this.revhate = revhate;
		this.revdate = revdate;
		this.reportcount = reportcount;
	}

	public int getOriginno() {
		return originno;
	}

	public void setOriginno(int originno) {
		this.originno = originno;
	}

	public String getReportedb() {
		return reportedb;
	}

	public void setReportedb(String reportedb) {
		this.reportedb = reportedb;
	}

	public String getReporterb() {
		return reporterb;
	}

	public void setReporterb(String reporterb) {
		this.reporterb = reporterb;
	}

	public String getReportbtype() {
		return reportbtype;
	}

	public void setReportbtype(String reportbtype) {
		this.reportbtype = reportbtype;
	}

	public Date getReportbdate() {
		return reportbdate;
	}

	public void setReportbdate(Date reportbdate) {
		this.reportbdate = reportbdate;
	}

	public String getReportbreason() {
		return reportbreason;
	}

	public void setReportbreason(String reportbreason) {
		this.reportbreason = reportbreason;
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

	public String getRevcontent() {
		return revcontent;
	}

	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}

	public int getRevstars() {
		return revstars;
	}

	public void setRevstars(int revstars) {
		this.revstars = revstars;
	}

	public int getRevgood() {
		return revgood;
	}

	public void setRevgood(int revgood) {
		this.revgood = revgood;
	}

	public int getRevhate() {
		return revhate;
	}

	public void setRevhate(int revhate) {
		this.revhate = revhate;
	}

	public Date getRevdate() {
		return revdate;
	}

	public void setRevdate(Date revdate) {
		this.revdate = revdate;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}

	@Override
	public String toString() {
		return "ReportBoard [originno=" + originno + ", reportedb=" + reportedb + ", reporterb=" + reporterb
				+ ", reportbtype=" + reportbtype + ", reportbdate=" + reportbdate + ", reportbreason=" + reportbreason
				+ ", objetno=" + objetno + ", userid=" + userid + ", objettitle=" + objettitle + ", objetintro="
				+ objetintro + ", originmainposter=" + originmainposter + ", renamemainposter=" + renamemainposter
				+ ", objetstartdate=" + objetstartdate + ", objetenddate=" + objetenddate + ", objettag=" + objettag
				+ ", publicyn=" + publicyn + ", objetregidate=" + objetregidate + ", objetstatus=" + objetstatus
				+ ", objetview=" + objetview + ", revcontent=" + revcontent + ", revstars=" + revstars + ", revgood="
				+ revgood + ", revhate=" + revhate + ", revdate=" + revdate + ", reportcount=" + reportcount + "]";
	}

	
	
}
