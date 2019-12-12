package com.kh.objet.usersprofile.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class UsersProfile implements Serializable{
	private static final long serialVersionUID = 17000L;
	
	private String userid;
	private String useropic;
	private String userrpic;
	private String userintros;
	private String userintrol;
	private String usertag;
	private String portfolio;
	private String facebook;
	private String instagram;
	private String etcurl;
	private String artistemail;

	public UsersProfile() {}

	public UsersProfile(String userid, String useropic, String userrpic, String userintros, String userintrol,
			String usertag, String portfolio, String facebook, String instagram, String etcurl, String artistemail) {
		super();
		this.userid = userid;
		this.useropic = useropic;
		this.userrpic = userrpic;
		this.userintros = userintros;
		this.userintrol = userintrol;
		this.usertag = usertag;
		this.portfolio = portfolio;
		this.facebook = facebook;
		this.instagram = instagram;
		this.etcurl = etcurl;
		this.artistemail = artistemail;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUseropic() {
		return useropic;
	}

	public void setUseropic(String useropic) {
		this.useropic = useropic;
	}

	public String getUserrpic() {
		return userrpic;
	}

	public void setUserrpic(String userrpic) {
		this.userrpic = userrpic;
	}

	public String getUserintros() {
		return userintros;
	}

	public void setUserintros(String userintros) {
		this.userintros = userintros;
	}

	public String getUserintrol() {
		return userintrol;
	}

	public void setUserintrol(String userintrol) {
		this.userintrol = userintrol;
	}

	public String getUsertag() {
		return usertag;
	}

	public void setUsertag(String usertag) {
		this.usertag = usertag;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getEtcurl() {
		return etcurl;
	}

	public void setEtcurl(String etcurl) {
		this.etcurl = etcurl;
	}

	public String getArtistemail() {
		return artistemail;
	}

	public void setArtistemail(String artistemail) {
		this.artistemail = artistemail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UsersProfile [userid=" + userid + ", useropic=" + useropic + ", userrpic=" + userrpic + ", userintros="
				+ userintros + ", userintrol=" + userintrol + ", usertag=" + usertag + ", portfolio=" + portfolio
				+ ", facebook=" + facebook + ", instagram=" + instagram + ", etcurl=" + etcurl + ", artistemail="
				+ artistemail + "]";
	}
	
	

}
