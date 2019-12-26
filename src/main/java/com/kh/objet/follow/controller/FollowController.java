package com.kh.objet.follow.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.follow.model.service.FollowServiceImpl;
import com.kh.objet.follow.model.vo.Following;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.users.model.vo.UAUP;

@Controller
public class FollowController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired
	public FollowServiceImpl followService;
	
	public FollowController() {}
	
	// 최민영 ******************************************
	
	// 팔로잉 보기
		@RequestMapping("moveFollowingPage.do")
		public String moveFollowingPage(String userid, Paging paging, HttpServletRequest request) {
			return "artistHome/following";
		}
	
		
	// 팔로워 보기
		@RequestMapping("moveFollowerPage.do")
		public String moveFollowerPage(String userid, Paging paging) {
			return "artistHome/follower";
		}
	
	// 팔로우하기(ajax)
		@RequestMapping("insertFollowing.do")
		public void insertFollowing(Following following) {
		}
	
	// 언팔로잉 하기
		@RequestMapping("deleteFollowing.do")
		public void deleteFollowing(Following following) {
		}

/*	
	// 팔로워 추가
		@RequestMapping("insertFollower.do")
		public void insertFollower(Follower follower) {
			
		}
		
	// 팔로워 삭제
		@RequestMapping("deleteFollower.do")
		public void deleteFollower(Follower follower) {
		}
*/	

	
}
