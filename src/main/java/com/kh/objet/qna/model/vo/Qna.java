package com.kh.objet.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Qna implements Serializable{
   private static final long serialVersionUID = 11000L;

   private int qnano;
   private String userid;
   private String adminid;
   private String qnatype;
   private String qnatitle;
   private String qnacontent;
   private Date questiondate;
   private String qnaanswer;
   private Date answerdate;
   private String qnaofile;
   private String qnarfile;
   private String qnaanswertype;

   
   public Qna() {}



public Qna(int qnano, String userid, String adminid, String qnatype, String qnatitle, String qnacontent,
		Date questiondate, String qnaanswer, Date answerdate, String qnaofile, String qnarfile, String qnaanswertype) {
	super();
	this.qnano = qnano;
	this.userid = userid;
	this.adminid = adminid;
	this.qnatype = qnatype;
	this.qnatitle = qnatitle;
	this.qnacontent = qnacontent;
	this.questiondate = questiondate;
	this.qnaanswer = qnaanswer;
	this.answerdate = answerdate;
	this.qnaofile = qnaofile;
	this.qnarfile = qnarfile;
	this.qnaanswertype = qnaanswertype;
}



public int getQnano() {
	return qnano;
}


public void setQnano(int qnano) {
	this.qnano = qnano;
}


public String getUserid() {
	return userid;
}


public void setUserid(String userid) {
	this.userid = userid;
}


public String getAdminid() {
	return adminid;
}


public void setAdminid(String adminid) {
	this.adminid = adminid;
}


public String getQnatype() {
	return qnatype;
}


public void setQnatype(String qnatype) {
	this.qnatype = qnatype;
}


public String getQnatitle() {
	return qnatitle;
}


public void setQnatitle(String qnatitle) {
	this.qnatitle = qnatitle;
}


public String getQnacontent() {
	return qnacontent;
}


public void setQnacontent(String qnacontent) {
	this.qnacontent = qnacontent;
}


public Date getQuestiondate() {
	return questiondate;
}


public void setQuestiondate(Date questiondate) {
	this.questiondate = questiondate;
}


public String getQnaanswer() {
	return qnaanswer;
}


public void setQnaanswer(String qnaanswer) {
	this.qnaanswer = qnaanswer;
}


public Date getAnswerdate() {
	return answerdate;
}


public void setAnswerdate(Date answerdate) {
	this.answerdate = answerdate;
}


public String getQnaofile() {
	return qnaofile;
}


public void setQnaofile(String qnaofile) {
	this.qnaofile = qnaofile;
}


public String getQnarfile() {
	return qnarfile;
}


public void setQnarfile(String qnarfile) {
	this.qnarfile = qnarfile;
}


public String getQnaanswertype() {
	return qnaanswertype;
}


public void setQnaanswertype(String qnaanswertype) {
	this.qnaanswertype = qnaanswertype;
}



@Override
public String toString() {
	return "Qna [qnano=" + qnano + ", userid=" + userid + ", adminid=" + adminid + ", qnatype=" + qnatype
			+ ", qnatitle=" + qnatitle + ", qnacontent=" + qnacontent + ", questiondate=" + questiondate
			+ ", qnaanswer=" + qnaanswer + ", answerdate=" + answerdate + ", qnaofile=" + qnaofile + ", qnarfile="
			+ qnarfile + ", qnaanswertype=" + qnaanswertype + "]";
}


  
   
   
}