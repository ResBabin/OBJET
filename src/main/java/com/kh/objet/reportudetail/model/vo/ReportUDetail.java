package com.kh.objet.reportudetail.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ReportUDetail implements Serializable {
	private static final long serialVersionUID = 14000L;
	
	private String reportedu;
	private String reporteru;
	private Date reportudate;
	private String reportureason;
	private int reportucount;
	
	public ReportUDetail() {}

	public ReportUDetail(String reportedu, String reporteru, Date reportudate, String reportureason, int reportucount) {
		super();
		this.reportedu = reportedu;
		this.reporteru = reporteru;
		this.reportudate = reportudate;
		this.reportureason = reportureason;
		this.reportucount = reportucount;
	}

	public String getReportedu() {
		return reportedu;
	}

	public void setReportedu(String reportedu) {
		this.reportedu = reportedu;
	}

	public String getReporteru() {
		return reporteru;
	}

	public void setReporteru(String reporteru) {
		this.reporteru = reporteru;
	}

	public Date getReportudate() {
		return reportudate;
	}

	public void setReportudate(Date reportudate) {
		this.reportudate = reportudate;
	}

	public String getReportureason() {
		return reportureason;
	}

	public void setReportureason(String reportureason) {
		this.reportureason = reportureason;
	}

	public int getReportucount() {
		return reportucount;
	}

	public void setReportucount(int reportucount) {
		this.reportucount = reportucount;
	}

	@Override
	public String toString() {
		return "ReportUDetail [reportedu=" + reportedu + ", reporteru=" + reporteru + ", reportudate=" + reportudate
				+ ", reportureason=" + reportureason + ", reportucount=" + reportucount + "]";
	}

	

}
