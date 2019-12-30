package com.kh.objet.follow.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Follow implements Serializable {

	private static final long serialVersionUID = 5394328572558887531L;
	
	private String userid;
	private String nickname;
	private String userrpic;
	private String userintros;
	private String followyn;
	
	public Follow() {}

	public Follow(String userid, String nickname, String userrpic, String userintros, String followyn) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.userrpic = userrpic;
		this.userintros = userintros;
		this.followyn = followyn;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getFollowyn() {
		return followyn;
	}

	public void setFollowyn(String followyn) {
		this.followyn = followyn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Follow [userid=" + userid + ", nickname=" + nickname + ", userrpic=" + userrpic + ", userintros="
				+ userintros + ", followyn=" + followyn + "]";
	}
	
	

}
