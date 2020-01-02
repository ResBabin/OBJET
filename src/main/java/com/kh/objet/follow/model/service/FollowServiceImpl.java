package com.kh.objet.follow.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.follow.model.dao.FollowDao;
import com.kh.objet.follow.model.vo.Follow;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;

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
	public List<Follow> moveFollowingPage(String artistid) {
		return followDao.moveFollowingPage(artistid);
	}

	// 팔로우 하기
	@Override
	public int insertFollowing(Following following) {
		return followDao.insertFollowing(following);
	}

	// 팔로워 증가
	@Override
	public int insertFollower(Follower follower) {
		return followDao.insertFollower(follower);
	}
	
	// 팔로잉 피드알림 보낼 때 닉네임 얻어오기
	public String getNickname(String from_user) {
		return followDao.getNickname(from_user);
	}

	
	// 구독하기 취소
	@Override
	public int deleteFollowing(Following following) {
		return followDao.deleteFollowing(following);
	}

	// 팔로워에서도 삭제
	@Override
	public int deleteFollower(Follower follower) {
		return followDao.deleteFollower(follower);
	}
	
	
	// 팔로워 리스트카운트용
	@Override
	public int FollowerGetListCount(String userid) {
		return followDao.FollowerGetListCount(userid);
	}

	// 팔로워 보기
	@Override
	public List<Follow> moveFollowerPage(String artistid) {
		return followDao.moveFollowerPage(artistid);
	}
	
	// 팔로우 여부를 알기위해 로그인 유저의 팔로잉 확인
	public int selectFollowingList(Following following) {
		return followDao.selectFollowingList(following);
	}


		
		
		
		


	


	

}
