package com.kh.objet.follow.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;
import com.kh.objet.paging.model.vo.Paging;

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
	public ArrayList<Following> moveFollowingPage(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Following> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<Following>) list;
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
	public ArrayList<Follower> moveFollowerPage(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Follower> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<Follower>) list;
	}

	// 팔로워 증가
	public int insertFollower(Follower follower) {
		return mybatisSession.insert("", follower);
	}

	public int deleteFollower(Follower follower) {
		return mybatisSession.delete("", follower);
	}
	
	

}
