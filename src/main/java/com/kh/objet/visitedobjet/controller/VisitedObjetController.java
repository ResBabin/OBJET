package com.kh.objet.visitedobjet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		public String moveMyVisitedObjetList() {
			return "objet/myVisitedObjetList";
		}
		
		
	//오브제 관리 - 다녀온 오브제 삭제
		@RequestMapping("deleteMyVisitedObjetList.do")
		public String deleteMyVisitedObjetList() {
			return "objet/myVisitedObjetList";
		}
		
	//오브제 관리 - 다녀온 오브제 검색
		@RequestMapping("selectMyVisitedObjetSearch.do")
		public String selectMyVisitedObjetSearch() {
			return "objet/myVisitedObjetList";
		}

}
