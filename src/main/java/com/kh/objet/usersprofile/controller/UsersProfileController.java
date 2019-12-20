package com.kh.objet.usersprofile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.usersprofile.model.service.UsersProfileServiceImpl;

@Controller
public class UsersProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(UsersProfileController.class);
	
	@Autowired
	private UsersProfileServiceImpl usersProfileService;
	
	public UsersProfileController() {}
	
	// 최민영 *********************************************
	// 작가소개수정 이동
		@RequestMapping("moveArtistIntroEdit.do")
		public String moveArtistIntroEdit() {
			return "artistHome/artistIntroEdit";
		}
	
	// 작가소개수정
		@RequestMapping("updateArtistIntro.do")
		public String updateArtistIntro() {
			return "artistHome/artistHomeMain";
		}

}
