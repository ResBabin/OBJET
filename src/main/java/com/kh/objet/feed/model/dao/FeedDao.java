package com.kh.objet.feed.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.paging.model.vo.Paging;

@Repository("feedDao")
public class FeedDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public FeedDao() {}

	//최민영 **************************
	// 피드 리스트카운트 조회용
	public int feedListCount(String userid) {
		return mybatisSession.selectOne("", userid);
	}

	// 피드알림 페이지 이동
	public ArrayList<Feed> moveFeedList(String artistid) {
		List<Feed> list = mybatisSession.selectList("userMapper.moveFeedList", artistid);
		return (ArrayList<Feed>) list;
	}

	// 피드알림 삭제
	public int deleteFeed(int feedno) {
		return mybatisSession.delete("userMapper.deleteFeed", feedno);
	}
}
