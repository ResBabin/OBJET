package com.kh.objet.objet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	public ObjetController() {}

	//�쟾�떆 硫붿씤�럹�씠吏� �씠�룞
	@RequestMapping("objetMain.do")
	public String moveObjetPage() {
		return "objet/objetMain";
	}
	
	//전시소개 테스트
	@RequestMapping("objetIntro.do")
	public String moveObjetIntroPage() {
		return "objet/objetIntro";
	}
	
	//오브제 검색 결과(전시/작가)
	@RequestMapping("objetSearchList.do")
	public String selectObjetSearchList() {
		return "objet/searchList";
	}
	
	//오브제 전시 전체 리스트
	@RequestMapping("objetAllList.do")
	public String selectObjetAllList() {
		return "objet/objetAllList";
	}
	
	//오브제 작가 전체 리스트
	@RequestMapping("artistAllList.do")
	public String selectArtistAllList() {
		return "objet/artistAllList";
	}
	
	//오브제 상세보기 
	@RequestMapping("objetOne.do")
	public String selectObjetOne() {
		return "objet/objetDetail";
	}

	//오브제 신고페이지 이동
	@RequestMapping("moveObjetReport.do")
	public String moveObjetReport() {
		return "objet/objetReport";
	}
	
	//오브제 신고
	@RequestMapping("objetReport.do")
	public String insertObjetReport() {
		return "objet/objetMain";
	}
	
	/*//한줄평 삭제
	@RequestMapping("deleteReview.do")
	public String deleteReview(String userid) {
		return "objet/objetReviewDelete";
	}*/

	//한줄평 신고페이지 이동
	
	//한줄평 신고
	
	
	// 최민영 *******************************************************************************
	// 작가홈 오브제 리스트 보기
			@RequestMapping(value= {"selectArtistObjetList.do", "artistHomeMain.do"})
			public String selectArtistObjetList(@RequestParam("userid") String userid) {
				return "artistHome/artistHomeMain";
			}
			
	// 작가홈 오브제 검색
			@RequestMapping("selectArtistObjetSearch.do")
			public String selectArtistObjetSearch(@RequestParam(value="objettitle") String objettitle) {
				return "artistHome/artistHomeMain";
			}

			
	
	// 오브제 관리-내 오브제 페이지 이동
		@RequestMapping("moveMyObjetList.do")
		public String moveMyObjetList(@RequestParam(value="userid") String userid, Paging paging) {
			return "objet/myObjetList";
		}
		
	// 오브제 관리-내 오브제 검색
		@RequestMapping("selectMyObjetSearch.do")
		public String selectMyObjetSearch(@RequestParam(value="publicyn") String publicyn, @RequestParam(value="objetstatus") String objetstatus, @RequestParam(value="objettitle") String objettitle, Paging paging) {
			return "objet/myObjetList";
		}
	
	//오브제 관리 - 내 오브제 상세보기
		@RequestMapping("moveMyObjetDetail.do")
		public String moveMyObjetDetail(@RequestParam(value="objetno") int objetno, Model model) {
			return "objet/myObjetDetail";
		}
		
	//오브제 관리 - 내 오브제 수정 페이지 이동
		@RequestMapping("moveEditObjet.do")
		public String moveEditObjet(@RequestParam(value="objetno") int objetno) {
			return "objet/editObjet";
		}
	
	//오브제 관리 - 내 오브제 수정
		@RequestMapping("updateMyObjet.do")
		public String updateMyObjet(Objet objet, Model model) {
			return "objet/myObjetDetail";
		}
	

	//오브제 관리 - 전시 등록 페이지 이동
		@RequestMapping("moveCreateObjet.do")
		public String moveCreateObjet() {
			return "objet/createObjet";
		}
		
	//오브제 관리 - 전시 등록
		@RequestMapping("insertObjet.do")
		public String insertObjet(Objet objet, Model model) {
			return "objet/myObjetList";
		}
		
	// 오브제 관리 - 전시삭제
		@RequestMapping("deleteObjet.do")
		public String deleteObjet(int objetno, Model model) {
			return "objet/myObjetList";
		}
		


}
