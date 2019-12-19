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
	
	//寃��깋�럹�씠吏� �씠�룞
	@RequestMapping("searchResult.do")
	public String moveSearchPage() {
		return "objet/searchList";
	}

	//�쟾�떆 硫붿씤�럹�씠吏� �씠�룞
	@RequestMapping("objetMain.do")
	public String moveObjetPage() {
		return "objet/objetMain";
	}

	//�쟾�떆 �뜑蹂닿린 �씠�룞
	@RequestMapping("objetMore.do")
	public String moveTestPage() {
		return "objet/objetMore";
	}
	
	//�쟾�떆 �냼媛� �씠�룞(�븳以꾪룊)
	@RequestMapping("objetReview.do")
	public String moveReviewPage() {
		return "objet/objetReview";
	}
	
	//전시소개 테스트
	@RequestMapping("objetIntro.do")
	public String moveObjetIntroPage() {
		return "objet/objetIntro";
	}
	
	
	
	// 理쒕�쇱쁺 *******************************************************************************
	// �삤釉뚯젣 愿�由�-�궡 �삤釉뚯젣 �럹�씠吏� �씠�룞
	@RequestMapping("moveMyObjetList.do")
	public String moveMyObjetList() {
		return "objet/myObjetList";
	}
	
	//�삤釉뚯젣 愿�由� - �궡 �삤釉뚯젣 �긽�꽭蹂닿린 �럹�씠吏� �씠�룞
	@RequestMapping("moveMyObjetDetail.do")
	public String moveMyObjetDetail() {
		return "objet/myObjetDetail";
	}
	
	//�삤釉뚯젣 愿�由� - �궡 �삤釉뚯젣 �닔�젙 �럹�씠吏� �씠�룞
		@RequestMapping("moveEditObjet.do")
		public String moveEditObjet() {
			return "objet/editObjet";
		}
	
	// �삤釉뚯젣 愿�由� - 愿��떖�삤釉뚯젣 �럹�씠吏� �씠�룞
	@RequestMapping("moveMyLikeObjetList.do")
	public String moveMyLikeObjetList() {
		return "objet/myLikeObjetList";
	}
	
	// �삤釉뚯젣 愿�由� - �떎���삩 �삤釉뚯젣 �럹�씠吏� �씠�룞
	@RequestMapping("moveMyVisitedObjetList.do")
	public String moveMyVisitedObjetList() {
		return "objet/myVisitedObjetList";
	}
	
	//�삤釉뚯젣 愿�由� - �쟾�떆 �벑濡� �럹�씠吏� �씠�룞
	@RequestMapping("moveCreateObjet.do")
	public String moveCreateObjet() {
		return "objet/createObjet";
	}












}
