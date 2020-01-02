package com.kh.objet.follow.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.follow.model.vo.Follow;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;

@Repository("followDao")
public class FollowDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public FollowDao() {}
	
	// 팔로잉 리스트카운트용
	public int FollowingGetListCount(String userid) {
		return mybatisSession.selectOne("userMapper.FollowingGetListCount", userid);
	}

	// 팔로잉 보기
	public List<Follow> moveFollowingPage(String artistid) {
		List<Follow> list = mybatisSession.selectList("userMapper.moveFollowingPage", artistid);
		return list;
	}

	// 팔로우 하기
	public int insertFollowing(Following following) {
		return mybatisSession.insert("userMapper.insertFollowing", following);
	}

	// 팔로워 증가
	public int insertFollower(Follower follower) {
		return mybatisSession.insert("userMapper.insertFollower", follower);
	}
	
	// 팔로잉 피드알림 보낼 때 닉네임 얻어오기
	public String getNickname(String from_user) {
		return mybatisSession.selectOne("userMapper.getNickname", from_user);
	}

	// 구독하기 취소
	public int deleteFollowing(Following following) {
		return mybatisSession.delete("userMapper.deleteFollowing", following);
	}
	
	// 팔로워에서도 삭제
	public int deleteFollower(Follower follower) {
		return mybatisSession.delete("userMapper.deleteFollower", follower);
	}


	
	
	
	// 팔로워 리스트카운트용
	public int FollowerGetListCount(String userid) {
		return mybatisSession.selectOne("userMapper.FollowerGetListCount", userid);
	}

	// 팔로워 보기
	public List<Follow> moveFollowerPage(String artistid) {
		
		List<Follow> list = mybatisSession.selectList("userMapper.moveFollowerPage", artistid);
		return list;
	}
	
	// 팔로우 여부를 알기위해 로그인 유저의 팔로잉 리스트 확인
	public int selectFollowingList(Following following) {
		return mybatisSession.selectOne("userMapper.selectFollowingList", following);
	}


	



	

}
