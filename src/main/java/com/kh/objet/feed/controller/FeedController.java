package com.kh.objet.feed.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.feed.model.service.FeedServiceImpl;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	public FeedServiceImpl feedService;
	
	public FeedController() {}
	
	// 최민영 *****************************************************
	// 피드알림 페이지 이동
		@RequestMapping("moveFeedList.do")
		public String moveFeedList(@RequestParam(value="userid") String userid, Paging paging) {
			return "user/feedList";
		}
		
	// 피드알림 삭제
		@RequestMapping("deleteFeed.do")
		public String deleteFeed(@RequestParam(value="feedno") int feedno) {
			return "user/feedList";
		}

}
