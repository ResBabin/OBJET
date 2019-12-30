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
	public List<Following> moveFollowingPage(String artistid) {
	
		
		List<Following> list = mybatisSession.selectList("userMapper.moveFollowingPage", artistid);
		return list;
	}

	// 팔로우 하기
	public int insertFollowing(Following following) {
		return mybatisSession.insert("", following);
	}

	// 팔로우 취소
	public int deleteFollowing(Following following) {
		return mybatisSession.delete("", following);
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
	

	// 팔로워 증가
	public int insertFollower(Follower follower) {
		return mybatisSession.insert("", follower);
	}

	public int deleteFollower(Follower follower) {
		return mybatisSession.delete("", follower);
	}

	

}
