package com.kh.objet.following.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.following.model.service.FollowingServiceImpl;

@Controller
public class FollowingController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowingController.class);
	
	@Autowired
	public FollowingServiceImpl followingService;
	
	public FollowingController() {}
	
	// 최민영 ******************************************
	// 팔로잉 보기
	@RequestMapping("moveFollowingPage.do")
	public String moveFollowingPage() {
		return "artistHome/following";
	}

}
