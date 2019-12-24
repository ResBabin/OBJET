package com.kh.objet.users.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UAUP implements Serializable{
	private static final long serialVersionUID = 20000L;
	
	private String userid;
	private String userpwd;
	private String usertype;
	private String username;
	private String nickname;
	private String email;
	private String phone;
	private String gender;
	private Date enrolldate;
	private String quityn;
	private String blackyn;
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

	public UAUP() {}

	public UAUP(String userid, String userpwd, String usertype, String username, String nickname,
			String email, String phone, String gender, Date enrolldate, String quityn, String blackyn, String useropic,
			String userrpic, String userintros, String userintrol, String usertag, String portfolio, String facebook,
			String instagram, String etcurl, String artistemail) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.usertype = usertype;
		this.username = username;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.enrolldate = enrolldate;
		this.quityn = quityn;
		this.blackyn = blackyn;
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

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getQuityn() {
		return quityn;
	}

	public void setQuityn(String quityn) {
		this.quityn = quityn;
	}

	public String getBlackyn() {
		return blackyn;
	}

	public void setBlackyn(String blackyn) {
		this.blackyn = blackyn;
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
		return "UsersAndUsersProfile [userid=" + userid + ", userpwd=" + userpwd + ", usertype=" + usertype
				+ ", username=" + username + ", nickname=" + nickname + ", email=" + email + ", phone=" + phone
				+ ", gender=" + gender + ", enrolldate=" + enrolldate + ", quityn=" + quityn + ", blackyn=" + blackyn
				+ ", useropic=" + useropic + ", userrpic=" + userrpic + ", userintros=" + userintros + ", userintrol="
				+ userintrol + ", usertag=" + usertag + ", portfolio=" + portfolio + ", facebook=" + facebook
				+ ", instagram=" + instagram + ", etcurl=" + etcurl + ", artistemail=" + artistemail + "]";
	}
	
	

}