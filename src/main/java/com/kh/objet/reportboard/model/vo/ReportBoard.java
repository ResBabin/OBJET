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
	private String objettitle1;
	private String objetintro1;
	private String objetofile1;
	private String objetrfile1;
	private String objettitle2;
	private String objetintro2;
	private String objetofile2;
	private String objetrfile2;
	private String objettitle3;
	private String objetintro3;
	private String objetofile3;
	private String objetrfile3;
	private String objettitle4;
	private String objetintro4;
	private String objetofile4;
	private String objetrfile4;
	private String objettitle5;
	private String objetintro5;
	private String objetofile5;
	private String objetrfile5;
	private String objettitle6;
	private String objetintro6;
	private String objetofile6;
	private String objetrfile6;
	private String objettitle7;
	private String objetintro7;
	private String objetofile7;
	private String objetrfile7;
	private String objettitle8;
	private String objetintro8;
	private String objetofile8;
	private String objetrfile8;
	private String revcontent;
	private int revstars;
	private int revgood;
	private int revhate;
	private Date revdate;
	private int reportcount;
	
	public ReportBoard() {
	}

	public ReportBoard(int originno, String reportedb, String reporterb, String reportbtype, Date reportbdate,
			String reportbreason, int objetno, String userid, String objettitle, String objetintro,
			String originmainposter, String renamemainposter, Date objetstartdate, Date objetenddate, String objettag,
			String publicyn, Date objetregidate, String objetstatus, int objetview, String objettitle1,
			String objetintro1, String objetofile1, String objetrfile1, String objettitle2, String objetintro2,
			String objetofile2, String objetrfile2, String objettitle3, String objetintro3, String objetofile3,
			String objetrfile3, String objettitle4, String objetintro4, String objetofile4, String objetrfile4,
			String objettitle5, String objetintro5, String objetofile5, String objetrfile5, String objettitle6,
			String objetintro6, String objetofile6, String objetrfile6, String objettitle7, String objetintro7,
			String objetofile7, String objetrfile7, String objettitle8, String objetintro8, String objetofile8,
			String objetrfile8, String revcontent, int revstars, int revgood, int revhate, Date revdate,
			int Reportcount) {
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
		this.objettitle1 = objettitle1;
		this.objetintro1 = objetintro1;
		this.objetofile1 = objetofile1;
		this.objetrfile1 = objetrfile1;
		this.objettitle2 = objettitle2;
		this.objetintro2 = objetintro2;
		this.objetofile2 = objetofile2;
		this.objetrfile2 = objetrfile2;
		this.objettitle3 = objettitle3;
		this.objetintro3 = objetintro3;
		this.objetofile3 = objetofile3;
		this.objetrfile3 = objetrfile3;
		this.objettitle4 = objettitle4;
		this.objetintro4 = objetintro4;
		this.objetofile4 = objetofile4;
		this.objetrfile4 = objetrfile4;
		this.objettitle5 = objettitle5;
		this.objetintro5 = objetintro5;
		this.objetofile5 = objetofile5;
		this.objetrfile5 = objetrfile5;
		this.objettitle6 = objettitle6;
		this.objetintro6 = objetintro6;
		this.objetofile6 = objetofile6;
		this.objetrfile6 = objetrfile6;
		this.objettitle7 = objettitle7;
		this.objetintro7 = objetintro7;
		this.objetofile7 = objetofile7;
		this.objetrfile7 = objetrfile7;
		this.objettitle8 = objettitle8;
		this.objetintro8 = objetintro8;
		this.objetofile8 = objetofile8;
		this.objetrfile8 = objetrfile8;
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

	public String getObjettitle1() {
		return objettitle1;
	}

	public void setObjettitle1(String objettitle1) {
		this.objettitle1 = objettitle1;
	}

	public String getObjetintro1() {
		return objetintro1;
	}

	public void setObjetintro1(String objetintro1) {
		this.objetintro1 = objetintro1;
	}

	public String getObjetofile1() {
		return objetofile1;
	}

	public void setObjetofile1(String objetofile1) {
		this.objetofile1 = objetofile1;
	}

	public String getObjetrfile1() {
		return objetrfile1;
	}

	public void setObjetrfile1(String objetrfile1) {
		this.objetrfile1 = objetrfile1;
	}

	public String getObjettitle2() {
		return objettitle2;
	}

	public void setObjettitle2(String objettitle2) {
		this.objettitle2 = objettitle2;
	}

	public String getObjetintro2() {
		return objetintro2;
	}

	public void setObjetintro2(String objetintro2) {
		this.objetintro2 = objetintro2;
	}

	public String getObjetofile2() {
		return objetofile2;
	}

	public void setObjetofile2(String objetofile2) {
		this.objetofile2 = objetofile2;
	}

	public String getObjetrfile2() {
		return objetrfile2;
	}

	public void setObjetrfile2(String objetrfile2) {
		this.objetrfile2 = objetrfile2;
	}

	public String getObjettitle3() {
		return objettitle3;
	}

	public void setObjettitle3(String objettitle3) {
		this.objettitle3 = objettitle3;
	}

	public String getObjetintro3() {
		return objetintro3;
	}

	public void setObjetintro3(String objetintro3) {
		this.objetintro3 = objetintro3;
	}

	public String getObjetofile3() {
		return objetofile3;
	}

	public void setObjetofile3(String objetofile3) {
		this.objetofile3 = objetofile3;
	}

	public String getObjetrfile3() {
		return objetrfile3;
	}

	public void setObjetrfile3(String objetrfile3) {
		this.objetrfile3 = objetrfile3;
	}

	public String getObjettitle4() {
		return objettitle4;
	}

	public void setObjettitle4(String objettitle4) {
		this.objettitle4 = objettitle4;
	}

	public String getObjetintro4() {
		return objetintro4;
	}

	public void setObjetintro4(String objetintro4) {
		this.objetintro4 = objetintro4;
	}

	public String getObjetofile4() {
		return objetofile4;
	}

	public void setObjetofile4(String objetofile4) {
		this.objetofile4 = objetofile4;
	}

	public String getObjetrfile4() {
		return objetrfile4;
	}

	public void setObjetrfile4(String objetrfile4) {
		this.objetrfile4 = objetrfile4;
	}

	public String getObjettitle5() {
		return objettitle5;
	}

	public void setObjettitle5(String objettitle5) {
		this.objettitle5 = objettitle5;
	}

	public String getObjetintro5() {
		return objetintro5;
	}

	public void setObjetintro5(String objetintro5) {
		this.objetintro5 = objetintro5;
	}

	public String getObjetofile5() {
		return objetofile5;
	}

	public void setObjetofile5(String objetofile5) {
		this.objetofile5 = objetofile5;
	}

	public String getObjetrfile5() {
		return objetrfile5;
	}

	public void setObjetrfile5(String objetrfile5) {
		this.objetrfile5 = objetrfile5;
	}

	public String getObjettitle6() {
		return objettitle6;
	}

	public void setObjettitle6(String objettitle6) {
		this.objettitle6 = objettitle6;
	}

	public String getObjetintro6() {
		return objetintro6;
	}

	public void setObjetintro6(String objetintro6) {
		this.objetintro6 = objetintro6;
	}

	public String getObjetofile6() {
		return objetofile6;
	}

	public void setObjetofile6(String objetofile6) {
		this.objetofile6 = objetofile6;
	}

	public String getObjetrfile6() {
		return objetrfile6;
	}

	public void setObjetrfile6(String objetrfile6) {
		this.objetrfile6 = objetrfile6;
	}

	public String getObjettitle7() {
		return objettitle7;
	}

	public void setObjettitle7(String objettitle7) {
		this.objettitle7 = objettitle7;
	}

	public String getObjetintro7() {
		return objetintro7;
	}

	public void setObjetintro7(String objetintro7) {
		this.objetintro7 = objetintro7;
	}

	public String getObjetofile7() {
		return objetofile7;
	}

	public void setObjetofile7(String objetofile7) {
		this.objetofile7 = objetofile7;
	}

	public String getObjetrfile7() {
		return objetrfile7;
	}

	public void setObjetrfile7(String objetrfile7) {
		this.objetrfile7 = objetrfile7;
	}

	public String getObjettitle8() {
		return objettitle8;
	}

	public void setObjettitle8(String objettitle8) {
		this.objettitle8 = objettitle8;
	}

	public String getObjetintro8() {
		return objetintro8;
	}

	public void setObjetintro8(String objetintro8) {
		this.objetintro8 = objetintro8;
	}

	public String getObjetofile8() {
		return objetofile8;
	}

	public void setObjetofile8(String objetofile8) {
		this.objetofile8 = objetofile8;
	}

	public String getObjetrfile8() {
		return objetrfile8;
	}

	public void setObjetrfile8(String objetrfile8) {
		this.objetrfile8 = objetrfile8;
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
				+ ", objetview=" + objetview + ", objettitle1=" + objettitle1 + ", objetintro1=" + objetintro1
				+ ", objetofile1=" + objetofile1 + ", objetrfile1=" + objetrfile1 + ", objettitle2=" + objettitle2
				+ ", objetintro2=" + objetintro2 + ", objetofile2=" + objetofile2 + ", objetrfile2=" + objetrfile2
				+ ", objettitle3=" + objettitle3 + ", objetintro3=" + objetintro3 + ", objetofile3=" + objetofile3
				+ ", objetrfile3=" + objetrfile3 + ", objettitle4=" + objettitle4 + ", objetintro4=" + objetintro4
				+ ", objetofile4=" + objetofile4 + ", objetrfile4=" + objetrfile4 + ", objettitle5=" + objettitle5
				+ ", objetintro5=" + objetintro5 + ", objetofile5=" + objetofile5 + ", objetrfile5=" + objetrfile5
				+ ", objettitle6=" + objettitle6 + ", objetintro6=" + objetintro6 + ", objetofile6=" + objetofile6
				+ ", objetrfile6=" + objetrfile6 + ", objettitle7=" + objettitle7 + ", objetintro7=" + objetintro7
				+ ", objetofile7=" + objetofile7 + ", objetrfile7=" + objetrfile7 + ", objettitle8=" + objettitle8
				+ ", objetintro8=" + objetintro8 + ", objetofile8=" + objetofile8 + ", objetrfile8=" + objetrfile8
				+ ", revcontent=" + revcontent + ", revstars=" + revstars + ", revgood=" + revgood + ", revhate="
				+ revhate + ", revdate=" + revdate + ", reportcount=" + reportcount + "]";
	}
	
	

}
