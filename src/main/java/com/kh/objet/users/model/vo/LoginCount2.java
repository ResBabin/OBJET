package com.kh.objet.users.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class LoginCount2  implements java.io.Serializable{
	private static final long serialVersionUID = 57913L;
private int loginall;
private String logindate;

public LoginCount2() {}


public LoginCount2(int loginall, String logindate) {
	super();
	this.loginall = loginall;
	this.logindate = logindate;
}




public int getLoginall() {
	return loginall;
}


public void setLoginall(int loginall) {
	this.loginall = loginall;
}


public String getLogindate() {
	return logindate;
}


public void setLogindate(String logindate) {
	this.logindate = logindate;
}


@Override
public String toString() {
	return ""+ loginall;
}




}
