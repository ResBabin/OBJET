package com.kh.objet.likeobjet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.likeobjet.model.service.LikeObjetServiceImpl;

@Controller
public class LikeObjetController {

	private static final Logger logger = LoggerFactory.getLogger(LikeObjetController.class);
	
	@Autowired
	public LikeObjetServiceImpl likeObjetService;
	
	public LikeObjetController() {}
	
	// 최민영 *****************************************
	// 오브제 관리 - 관심오브제 페이지 이동
		@RequestMapping("moveMyLikeObjetList.do")
		public String moveMyLikeObjetList() {
			return "objet/myLikeObjetList";
		}
	

	// 오브제 관리 - 관심오브제 삭제
		@RequestMapping("deleteMyLikeObjetList.do")
		public String deleteMyLikeObjetList() {
			return "objet/myLikeObjetList";
		}
		
	// 오브제 관리 - 관심오브제 검색
		@RequestMapping("selectMyLikeObjetSearch.do")
		public String selectMyLikeObjetSearch() {
			return "objet/myLikeObjetList";
		}
	

}
