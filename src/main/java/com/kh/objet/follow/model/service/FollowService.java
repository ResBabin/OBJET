package com.kh.objet.follow.model.service;

import java.util.ArrayList;

import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;
import com.kh.objet.paging.model.vo.Paging;

public interface FollowService {
	
	int FollowingGetListCount(String userid);
	
	ArrayList<Following> moveFollowingPage(String userid, Paging paging);
	
	int insertFollowing(Following following);
	
	int deleteFollowing(Following following);
	
	
	
	int FollowerGetListCount(String userid);
	
	ArrayList<Follower> moveFollowerPage(String userid, Paging paging);
	
	int insertFollower(Follower follower);
	
	int deleteFollower(Follower follower);
}
