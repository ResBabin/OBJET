package com.kh.objet.visitedobjet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.visitedobjet.model.service.VisitedObjetServiceImpl;

@Controller
public class VisitedObjetController {
	
	private static final Logger logger = LoggerFactory.getLogger(VisitedObjetController.class);
	
	@Autowired
	private VisitedObjetServiceImpl visitedObjetService;
	
	public VisitedObjetController() {}
	
	
	// 최민영 **************************************
	// 오브제 관리 - 다녀온 오브제 페이지 이동
		@RequestMapping("moveMyVisitedObjetList.do")
		public String moveMyVisitedObjetList(Model model, HttpServletRequest request, HttpServletResponse response, Paging paging) {
			return "objet/myVisitedObjetList";
		}
		
		
	//오브제 관리 - 다녀온 오브제 삭제
		@RequestMapping("deleteMyVisitedObjetList.do")
		public String deleteMyVisitedObjetList(@RequestParam(value="objetno") int objetno) {
			return "objet/myVisitedObjetList";
		}
		
	//오브제 관리 - 다녀온 오브제 검색
		@RequestMapping("selectMyVisitedObjetSearch.do")
		public String selectMyVisitedObjetSearch(@RequestParam(value="objettitle") String objettitle, @RequestParam(value="userid") String userid, @RequestParam(value="objetstatus") String objetstatus, Paging paging) {
			return "objet/myVisitedObjetList";
		}

}
