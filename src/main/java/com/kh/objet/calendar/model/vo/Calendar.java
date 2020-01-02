package com.kh.objet.calendar.model.vo;

public class Calendar implements java.io.Serializable{
	
	private static final long serialVersionUID = 12712L;
	
	private int calnum;
	private String objettitle;
	private String description;
	private String startdate;
	private String enddate;
	private String category;
	private String userid;
	private String backgroundcolor;
	private String textcolor;
	
	public Calendar() {}
	
	public Calendar(int calnum, String objettitle, String description, String startdate, String enddate, String category, String userid, String backgroundcolor, String textcolor) {
		super();
		this.calnum = calnum;
		this.objettitle = objettitle;
		this.description = description;
		this.startdate = startdate;
		this.enddate = enddate;
		this.category = category;
		this.userid = userid;
		this.backgroundcolor = backgroundcolor;
		this.textcolor = textcolor;
	}
	
	public int getCalnum() {
		return calnum;
	}
	
	public void setCalnum(int calnum) {
		this.calnum = calnum;
	}
	
	public String getObjettitle() {
		return objettitle;
	}
	
	public void setObjettitle(String objettitle) {
		this.objettitle = objettitle;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStartdate() {
		return startdate;
	}
	
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	
	public String getEnddate() {
		return enddate;
	}
	
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getBackgroundcolor() {
		return backgroundcolor;
	}
	
	public void setBackgroundcolor(String backgroundcolor) {
		this.backgroundcolor = backgroundcolor;
	}
	
	public String getTextcolor() {
		return textcolor;
	}
	
	public void setTextcolor(String textcolor) {
		this.textcolor = textcolor;
	}

	@Override
	public String toString() {
		return "Calendar [calnum=" + calnum + ", objettitle=" + objettitle + ", description=" + description
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", category=" + category + ", userid="
				+ userid + ", backgroundcolor=" + backgroundcolor + ", textcolor=" + textcolor + "]";
	}
	
}
