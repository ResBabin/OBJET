package com.kh.objet.faq.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Faq implements Serializable{
   private static final long serialVersionUID = 2000L;

   private int faqno;
   private String adminid;
   private String faqtype;
   private String faqtitle;
   private String faqcontent;
   
   public Faq() {}

   public Faq(int faqno, String adminid, String faqtype, String faqtitle, String faqcontent) {
      super();
      this.faqno = faqno;
      this.adminid = adminid;
      this.faqtype = faqtype;
      this.faqtitle = faqtitle;
      this.faqcontent = faqcontent;
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

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public String toString() {
      return "Faq [faqno=" + faqno + ", adminid=" + adminid + ", faqtype=" + faqtype + ", faqtitle=" + faqtitle
            + ", faqcontent=" + faqcontent + "]";
   }
   
   
}