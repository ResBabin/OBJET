package com.kh.objet.follow.model.service;

import java.util.List;

import com.kh.objet.follow.model.vo.Follow;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;

public interface FollowService {
	
	int FollowingGetListCount(String userid);
	
	List<Follow> moveFollowingPage(String artistid);
	
	int insertFollowing(Following following);
	
	int deleteFollowing(Following following);
	
	
	
	int FollowerGetListCount(String userid);
	
	List<Follow> moveFollowerPage(String artistid);
	
	int selectFollowingList(Following following);
	
	int insertFollower(Follower follower);
	
	int deleteFollower(Follower follower);
	
	String getNickname(String from_user);

}
