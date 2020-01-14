package com.kh.objet.objet.model.vo;

public class Search implements java.io.Serializable{
	private static final long serialVersionUID = 10003L;
	
	private int objetcnt;
	private int followercnt;
	private int followingcnt;
	
	public Search() {}

	public Search(int objetcnt, int followercnt, int followingcnt) {
		super();
		this.objetcnt = objetcnt;
		this.followercnt = followercnt;
		this.followingcnt = followingcnt;
	}

	public Search(int objetcnt) {
		super();
		this.objetcnt = objetcnt;
	}

	public Search(int objetcnt, int followercnt) {
		super();
		this.objetcnt = objetcnt;
		this.followercnt = followercnt;
	}

	public int getObjetcnt() {
		return objetcnt;
	}

	public void setObjetcnt(int objetcnt) {
		this.objetcnt = objetcnt;
	}

	public int getFollowercnt() {
		return followercnt;
	}

	public void setFollowercnt(int followercnt) {
		this.followercnt = followercnt;
	}

	public int getFollowingcnt() {
		return followingcnt;
	}

	public void setFollowingcnt(int followingcnt) {
		this.followingcnt = followingcnt;
	}

	@Override
	public String toString() {
		return "Search [objetcnt=" + objetcnt + ", followercnt=" + followercnt + ", followingcnt=" + followingcnt + "]";
	}
	
	
	
	

}
