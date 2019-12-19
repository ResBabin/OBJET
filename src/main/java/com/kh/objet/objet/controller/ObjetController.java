package com.kh.objet.objet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.objet.model.service.ObjetServiceImpl;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	public ObjetController() {}
	
	//검색페이지 이동
	@RequestMapping("searchResult.do")
	public String moveSearchPage() {
		return "objet/searchList";
	}

	//전시 메인페이지 이동
	@RequestMapping("objetMain.do")
	public String moveObjetPage() {
		return "objet/objetMain";
	}

	//전시 더보기 이동
	@RequestMapping("objetMore.do")
	public String moveTestPage() {
		return "objet/objetMore";
	}
	
	//전시 소개 이동(한줄평)
	@RequestMapping("objetReview.do")
	public String moveReviewPage() {
		return "objet/objetReview";
	}
	
	
	
	// 최민영 *******************************************************************************
	// 오브제 관리-전시관리 페이지 이동
	@RequestMapping("moveMyObjetList.do")
	public String moveMyObjetList() {
		return "objet/myObjetList";
	}
	
	// 오브제 관리 - 관심오브제 페이지 이동
	@RequestMapping("moveMyLikeObjetList.do")
	public String moveMyLikeObjetList() {
		return "objet/myLikeObjetList";
	}
	
	// 오브제 관리 - 다녀온 오브제 페이지 이동
	@RequestMapping("moveMyVisitedObjetList.do")
	public String moveMyVisitedObjetList() {
		return "objet/myVisitedObjetList";
	}
	
	//오브제 관리 - 전시 등록 페이지 이동
	@RequestMapping("moveCreateObjet.do")
	public String moveCreateObjet() {
		return "objet/createObjet";
	}











}
