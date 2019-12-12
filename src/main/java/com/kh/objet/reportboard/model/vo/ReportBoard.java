package com.kh.objet.reportboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import oracle.sql.NUMBER;

@Component
public class ReportBoard implements Serializable{

	private static final long serialVersionUID = 13000L;

	private int originno;
	private String reportedb;
	private String reporterb;
	private String reportbtype;
	private Date reportbdate;
	private String reportbreason;
	
	public ReportBoard() {}

	public ReportBoard(int originno, String reportedb, String reporterb, String reportbtype, Date reportbdate,
			String reportbreason) {
		super();
		this.originno = originno;
		this.reportedb = reportedb;
		this.reporterb = reporterb;
		this.reportbtype = reportbtype;
		this.reportbdate = reportbdate;
		this.reportbreason = reportbreason;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReportBoard [originno=" + originno + ", reportedb=" + reportedb + ", reporterb=" + reporterb
				+ ", reportbtype=" + reportbtype + ", reportbdate=" + reportbdate + ", reportbreason=" + reportbreason
				+ "]";
	}
	
	
}
