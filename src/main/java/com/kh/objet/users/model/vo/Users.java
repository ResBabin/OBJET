package com.kh.objet.users.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Users implements Serializable{
	private static final long serialVersionUID = 16000L;
	
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

	public Users() {}

	public Users(String userid, String userpwd, String usertype, String username, String nickname, String email,
			String phone, String gender, Date enrolldate, String quityn, String blackyn) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Users [userid=" + userid + ", userpwd=" + userpwd + ", usertype=" + usertype + ", username=" + username
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", gender=" + gender
				+ ", enrolldate=" + enrolldate + ", quityn=" + quityn + ", blackyn=" + blackyn + "]";
	}
	
	

}
