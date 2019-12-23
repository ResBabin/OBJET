package com.kh.objet.follow.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.follow.model.dao.FollowDao;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;
import com.kh.objet.paging.model.vo.Paging;

@Service("followService")
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDao followDao;

	// 팔로잉 리스트카운트용
	@Override
	public int FollowingGetListCount(String userid) {
		return followDao.FollowingGetListCount(userid);
	}

	// 팔로잉 보기
	@Override
	public ArrayList<Following> moveFollowingPage(String userid, Paging paging) {
		return followDao.moveFollowingPage(userid, paging);
	}

	// 팔로우 하기
	@Override
	public int insertFollowing(Following following) {
		return followDao.insertFollowing(following);
	}

	// 팔로우 취소
	@Override
	public int deleteFollowing(Following following) {
		return followDao.deleteFollowing(following);
	}

	// 팔로워 리스트카운트용
	@Override
	public int FollowerGetListCount(String userid) {
		return followDao.FollowerGetListCount(userid);
	}

	// 팔로워 보기
	@Override
	public ArrayList<Follower> moveFollowerPage(String userid, Paging paging) {
		return followDao.moveFollowerPage(userid, paging);
	}

	// 팔로워 증가
	@Override
	public int insertFollower(Follower follower) {
		return followDao.insertFollower(follower);
	}

	// 팔로워 감소
	@Override
	public int deleteFollower(Follower follower) {
		return followDao.deleteFollower(follower);
	}

}
