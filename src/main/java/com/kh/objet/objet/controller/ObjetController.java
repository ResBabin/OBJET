package com.kh.objet.objet.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	@Autowired
	private Paging paging;
	
	
	
	public ObjetController() {}

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
	
	//오브제 전시감상페이지 이동
	@RequestMapping("objetView.do")
	public String objetVRView() {
		return "objet/objetView";
	}

	/*//오브제 신고페이지 이동
	@RequestMapping("moveObjetReport.do")
	public String moveObjetReport() {
		return "objet/objetReport";
	}
	
	//오브제 신고
	@RequestMapping("objetReport.do")
	public String insertObjetReport() {
		return "objet/objetMain";
	}*/
	
	/*//한줄평 삭제
	@RequestMapping("deleteReview.do")
	public String deleteReview(String userid) {
		return "objet/objetReviewDelete";
	}*/

	
	
	// 최민영 *******************************************************************************
	// 작가홈 오브제 리스트 보기
			@RequestMapping(value= "selectArtistObjetList.do", method=RequestMethod.POST)
			@ResponseBody
			public void selectArtistObjetList(@RequestParam("userid") String userid, @RequestParam("currentPage") String currentPage, HttpServletResponse response, Model model) throws IOException {
				
				//페이징처리 
				int curPage = Integer.valueOf(currentPage);
				int listCount = objetService.selectArtistObjetGetListCount(userid);
				paging.makePage(listCount, curPage);

				// HashMap 객체 생성
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("startRow", paging.getStartRow());
				map.put("endRow", paging.getEndRow());
				map.put("userid", userid); // 대상 아티스트 아이디

				logger.debug(paging.toString());
				
				List<Objet> objetlist = objetService.selectArtistObjetList(map);
						
				//가져온 객체 담기
				HashMap<String, Object> result = null;
				if(objetlist.size() >= 0) {
					result = new HashMap<String,Object>();
					result.put("paging", paging);
					result.put("objetlist", objetlist);
					result.put("objetkind", "all"); //출력타입은 전체(all) 과 분류(sort)로 나뉘어져있음
				} 
				
				//담은것 gson으로 처리
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				new Gson().toJson(result,response.getWriter());
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
