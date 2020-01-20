package com.kh.objet.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Notice implements Serializable{
   private static final long serialVersionUID = 9000L;
   
   private int rnum;
   private int noticeno;
   private String adminid;
   private String noticetype;
   private String noticetitle;
   private Date noticedate;
   private String noticecontent;
   private String noticeofile;
   private String noticerfile;

   
   public Notice() {}


public Notice(int rnum, int noticeno, String adminid, String noticetype, String noticetitle, Date noticedate,
      String noticecontent, String noticeofile, String noticerfile) {
   super();
   this.rnum = rnum;
   this.noticeno = noticeno;
   this.adminid = adminid;
   this.noticetype = noticetype;
   this.noticetitle = noticetitle;
   this.noticedate = noticedate;
   this.noticecontent = noticecontent;
   this.noticeofile = noticeofile;
   this.noticerfile = noticerfile;
}


public int getRnum() {
   return rnum;
}


public void setRnum(int rnum) {
   this.rnum = rnum;
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


public String getNoticeofile() {
   return noticeofile;
}


public void setNoticeofile(String noticeofile) {
   this.noticeofile = noticeofile;
}


public String getNoticerfile() {
   return noticerfile;
}


public void setNoticerfile(String noticerfile) {
   this.noticerfile = noticerfile;
}


@Override
public String toString() {
   return "Notice [rnum=" + rnum + ", noticeno=" + noticeno + ", adminid=" + adminid + ", noticetype=" + noticetype
         + ", noticetitle=" + noticetitle + ", noticedate=" + noticedate + ", noticecontent=" + noticecontent
         + ", noticeofile=" + noticeofile + ", noticerfile=" + noticerfile + "]";
}


   
}