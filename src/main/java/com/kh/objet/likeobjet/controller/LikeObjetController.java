package com.kh.objet.likeobjet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.likeobjet.model.service.LikeObjetServiceImpl;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class LikeObjetController {

	private static final Logger logger = LoggerFactory.getLogger(LikeObjetController.class);
	
	@Autowired
	public LikeObjetServiceImpl likeObjetService;
	
	public LikeObjetController() {}
	
	// 최민영 *****************************************
	// 오브제 관리 - 관심오브제 페이지 이동
		@RequestMapping("moveMyLikeObjetList.do")
		public String moveMyLikeObjetList(@RequestParam(value="userid") String userid, Paging paging) {
			return "objet/myLikeObjetList";
		}
	

	// 오브제 관리 - 관심오브제 삭제
		@RequestMapping("deleteMyLikeObjetList.do")
		public String deleteMyLikeObjetList(@RequestParam(value="objetno") int objetno) {
			return "objet/myLikeObjetList";
		}
		
	// 오브제 관리 - 관심오브제 검색
		@RequestMapping("selectMyLikeObjetSearch.do")
		public String selectMyLikeObjetSearch(@RequestParam(value="objettitle") String objettitle, @RequestParam(value="userid") String userid, @RequestParam(value="objetstatus") String objetstatus, Paging paging)  {
			return "objet/myLikeObjetList";
		}
	

}
