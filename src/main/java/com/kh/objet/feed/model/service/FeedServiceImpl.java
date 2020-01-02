package com.kh.objet.feed.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.feed.model.dao.FeedDao;
import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.paging.model.vo.Paging;

@Service("feedService")
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private FeedDao feedDao;

	//최민영 **************************
	// 피드 리스트카운트 조회용
	@Override
	public int feedListCount(String userid) {
		return feedDao.feedListCount(userid);
	}
	
	// 피드알림 페이지 이동
	@Override
	public ArrayList<Feed> moveFeedList(String artistid) {
		return feedDao.moveFeedList(artistid);
	}

	// 피드알림 삭제
	@Override
	public int deleteFeed(int feedno) {
		return feedDao.deleteFeed(feedno);
	}

	// 피드 추가
	@Override
	public int insertFeed(Feed feed) {
		return feedDao.insertFeed(feed);
	}

	

}
