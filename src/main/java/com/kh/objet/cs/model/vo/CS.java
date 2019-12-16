package com.kh.objet.cs.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

	@Component
	public class CS implements Serializable{
		private static final long serialVersionUID = 20182L;
		
		private int faqno;
		private String adminid;
		private String faqtype;
		private String faqtitle;
		private String faqcontent;
		private int noticeno;
		
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
		
		private int qnano;
		private String userid;
		private String qnatype;
		private String qnatitle;
		private String qnacontent;
		private Date questiondate;
		private String qnaanswer;
		private Date answerdate;
		private String qnaofile;
		private String qnarfile;
		
		public CS() {}

		public CS(int faqno, String adminid, String faqtype, String faqtitle, String faqcontent, int noticeno,
				String noticetype, String noticetitle, Date noticedate, String noticecontent, String noticeofile1,
				String noticerfile1, String noticeofile2, String noticerfile2, String noticeofile3, String noticerfile3,
				int qnano, String userid, String qnatype, String qnatitle, String qnacontent, Date questiondate,
				String qnaanswer, Date answerdate, String qnaofile, String qnarfile) {
			super();
			this.faqno = faqno;
			this.adminid = adminid;
			this.faqtype = faqtype;
			this.faqtitle = faqtitle;
			this.faqcontent = faqcontent;
			this.noticeno = noticeno;
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
			this.qnano = qnano;
			this.userid = userid;
			this.qnatype = qnatype;
			this.qnatitle = qnatitle;
			this.qnacontent = qnacontent;
			this.questiondate = questiondate;
			this.qnaanswer = qnaanswer;
			this.answerdate = answerdate;
			this.qnaofile = qnaofile;
			this.qnarfile = qnarfile;
		}

		public int getFaqno() {
			return faqno;
		}

		public void setFaqno(int faqno) {
			this.faqno = faqno;
		}

		public String getAdminid() {
			return adminid;
		}

		public void setAdminid(String adminid) {
			this.adminid = adminid;
		}

		public String getFaqtype() {
			return faqtype;
		}

		public void setFaqtype(String faqtype) {
			this.faqtype = faqtype;
		}

		public String getFaqtitle() {
			return faqtitle;
		}

		public void setFaqtitle(String faqtitle) {
			this.faqtitle = faqtitle;
		}

		public String getFaqcontent() {
			return faqcontent;
		}

		public void setFaqcontent(String faqcontent) {
			this.faqcontent = faqcontent;
		}

		public int getNoticeno() {
			return noticeno;
		}

		public void setNoticeno(int noticeno) {
			this.noticeno = noticeno;
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

		@Override
		public String toString() {
			return "CS [faqno=" + faqno + ", adminid=" + adminid + ", faqtype=" + faqtype + ", faqtitle=" + faqtitle
					+ ", faqcontent=" + faqcontent + ", noticeno=" + noticeno + ", noticetype=" + noticetype
					+ ", noticetitle=" + noticetitle + ", noticedate=" + noticedate + ", noticecontent=" + noticecontent
					+ ", noticeofile1=" + noticeofile1 + ", noticerfile1=" + noticerfile1 + ", noticeofile2="
					+ noticeofile2 + ", noticerfile2=" + noticerfile2 + ", noticeofile3=" + noticeofile3
					+ ", noticerfile3=" + noticerfile3 + ", qnano=" + qnano + ", userid=" + userid + ", qnatype="
					+ qnatype + ", qnatitle=" + qnatitle + ", qnacontent=" + qnacontent + ", questiondate="
					+ questiondate + ", qnaanswer=" + qnaanswer + ", answerdate=" + answerdate + ", qnaofile="
					+ qnaofile + ", qnarfile=" + qnarfile + "]";
		}
	
	}
