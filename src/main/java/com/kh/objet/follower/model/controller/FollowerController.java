package com.kh.objet.follower.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.follower.model.service.FollowerServiceImpl;

@Controller
public class FollowerController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowerController.class);
	
	@Autowired
	public FollowerServiceImpl followerService;
	
	public FollowerController() {}
	
	// 최민영 ******************************************
	// 팔로워 보기
		@RequestMapping("moveFollowerPage.do")
		public String moveFollowerPage() {
			return "artistHome/follower";
		}
		
	// 팔로우하기
		@RequestMapping("insertFollowing.do")
		public void insertFollowing() {
		}
		
	// 언팔로우하기
		@RequestMapping("deleteFollowing.do")
		public void deleteFollowing() {
		}

}
