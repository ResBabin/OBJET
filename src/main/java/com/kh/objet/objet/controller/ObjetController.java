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
	
	
	
	// 최민영 *******************************************************************************
	// 오브제 관리-내 오브제 페이지 이동
		@RequestMapping("moveMyObjetList.do")
		public String moveMyObjetList() {
			return "objet/myObjetList";
		}
	
	//오브제 관리 - 내 오브제 상세보기
		@RequestMapping("moveMyObjetDetail.do")
		public String moveMyObjetDetail() {
			return "objet/myObjetDetail";
		}
		
	//오브제 관리 - 내 오브제 수정 페이지 이동
		@RequestMapping("moveEditObjet.do")
		public String moveEditObjet() {
			return "objet/editObjet";
		}
	
	//오브제 관리 - 내 오브제 수정
		@RequestMapping("updateMyObjet.do")
		public String updateMyObjet() {
			return "objet/myObjetDetail";
		}
	

	//오브제 관리 - 전시 등록 페이지 이동
		@RequestMapping("moveCreateObjet.do")
		public String moveCreateObjet() {
			return "objet/createObjet";
		}
		
	//오브제 관리 - 전시 등록
		@RequestMapping("insertObjet.do")
		public String insertObjet() {
			return "objet/myObjetList";
		}
		
	// 작가홈 오브제 리스트 보기
		@RequestMapping("selectArtistObjetList.do")
		public String selectArtistObjetList() {
			return "artistHome/artistHomeMain";
		}
		
	// 작가홈 오브제 검색
		@RequestMapping("selectArtistObjetSearch.do")
		public String selectArtistObjetSearch() {
			return "artistHome/artistHomeMain";
		}












}
