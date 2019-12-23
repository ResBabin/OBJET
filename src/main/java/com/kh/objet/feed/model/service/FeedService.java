package com.kh.objet.feed.model.service;

import java.util.ArrayList;

import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.paging.model.vo.Paging;

public interface FeedService {

	// 최민영 *****************************
	int feedListCount(String userid);
	ArrayList<Feed> moveFeedList(String userid, Paging paging);
	int deleteFeed(int feedno);
}
