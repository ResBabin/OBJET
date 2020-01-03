package com.kh.objet.guestbook.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GB implements Serializable{
	private static final long serialVersionUID = -6586796244215220648L;
	
	private int gbno;
	private String artistid;
	private String artistnickname;
	private String artistrpic;
	private String userid;
	private String usernickname;
	private String userrpic;
	private String gbcontent;
	private Date gbdate;
	private String privateyn;
	private String replyyn;
	private String replycontent;
	private Date replydate;
	
	public GB() {}

	public GB(int gbno, String artistid, String artistnickname, String artistrpic, String userid,
			String usernickname, String userrpic, String gbcontent, Date gbdate, String privateyn, String replyyn,
			String replycontent, Date replydate) {
		super();
		this.gbno = gbno;
		this.artistid = artistid;
		this.artistnickname = artistnickname;
		this.artistrpic = artistrpic;
		this.userid = userid;
		this.usernickname = usernickname;
		this.userrpic = userrpic;
		this.gbcontent = gbcontent;
		this.gbdate = gbdate;
		this.privateyn = privateyn;
		this.replyyn = replyyn;
		this.replycontent = replycontent;
		this.replydate = replydate;
	}

	public int getGbno() {
		return gbno;
	}

	public void setGbno(int gbno) {
		this.gbno = gbno;
	}

	public String getArtistid() {
		return artistid;
	}

	public void setArtistid(String artistid) {
		this.artistid = artistid;
	}

	public String getArtistnickname() {
		return artistnickname;
	}

	public void setArtistnickname(String artistnickname) {
		this.artistnickname = artistnickname;
	}

	public String getArtistrpic() {
		return artistrpic;
	}

	public void setArtistrpic(String artistrpic) {
		this.artistrpic = artistrpic;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsernickname() {
		return usernickname;
	}

	public void setUsernickname(String usernickname) {
		this.usernickname = usernickname;
	}

	public String getUserrpic() {
		return userrpic;
	}

	public void setUserrpic(String userrpic) {
		this.userrpic = userrpic;
	}

	public String getGbcontent() {
		return gbcontent;
	}

	public void setGbcontent(String gbcontent) {
		this.gbcontent = gbcontent;
	}

	public Date getGbdate() {
		return gbdate;
	}

	public void setGbdate(Date gbdate) {
		this.gbdate = gbdate;
	}

	public String getPrivateyn() {
		return privateyn;
	}

	public void setPrivateyn(String privateyn) {
		this.privateyn = privateyn;
	}

	public String getReplyyn() {
		return replyyn;
	}

	public void setReplyyn(String replyyn) {
		this.replyyn = replyyn;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public Date getReplydate() {
		return replydate;
	}

	public void setReplydate(Date replydate) {
		this.replydate = replydate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GB [gbno=" + gbno + ", artistid=" + artistid + ", artistnickname=" + artistnickname + ", artistrpic="
				+ artistrpic + ", userid=" + userid + ", usernickname="
				+ usernickname + ", userrpic=" + userrpic + ", gbcontent=" + gbcontent + ", gbdate=" + gbdate
				+ ", privateyn=" + privateyn + ", replyyn=" + replyyn + ", replycontent=" + replycontent
				+ ", replydate=" + replydate + "]";
	}

	
	

}
