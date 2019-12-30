package com.kh.objet.objet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	public ObjetController() {}
	
	//오브제 검색 결과(전시/작가)
	@RequestMapping("objetSearchList.do")
	public String selectObjetSearchList() {
		return "objet/searchList";
	}
	
	//오브제 전시 전체 리스트
	@RequestMapping("objetAllList.do")
	public ModelAndView selectObjetAllList(ModelAndView mv) {
		ArrayList<Objet> objetList = objetService.selectObjetAllList();
		if(objetList != null) {
			mv.addObject("objetList", objetList);
			mv.setViewName("objet/objetAllList");
		}else {
			mv.addObject("objetList", objetList);
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	//오브제 작가 전체 리스트
	@RequestMapping("artistAllList.do")
	public ModelAndView selectArtistAllList(ModelAndView mv) {
		ArrayList<Artist> artistList = objetService.selectArtistAllList();
		if(artistList != null) {
			mv.addObject("artistList", artistList);
			mv.setViewName("objet/artistAllList");
		}else {
			mv.addObject("artistList", artistList);
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	//오브제 작가 전체리스트 정렬
	@RequestMapping(value="artistOrder.do", method=RequestMethod.POST)
	public void selectArtistListOrder(String order, HttpServletResponse response) throws IOException {
		ArrayList<Artist> artistListOrder = (ArrayList<Artist>)objetService.selectArtistListOrder(order);
		logger.debug(artistListOrder.get(0).getUserid());
		logger.debug(artistListOrder.get(1).getUserid());
		logger.debug(artistListOrder.get(2).getUserid());
		logger.debug(artistListOrder.get(3).getUserid());
		//전송용 json 객체
		JSONObject sendJson = new JSONObject();
		//json 배열 객체
		JSONArray jarr = new JSONArray();
		//list를 jarr 로 옮겨 저장 (복사)
		for( Artist artist : artistListOrder) {
			
		JSONObject job = new JSONObject();
		job.put("userintrol", URLEncoder.encode(artist.getUserintrol(), "utf-8"));
		job.put("usertag", URLEncoder.encode(artist.getUsertag(), "utf-8"));
		job.put("nickname", URLEncoder.encode(artist.getNickname(), "utf-8"));
		job.put("renamemainposter", artist.getRenamemainposter());
		job.put("userrpic", artist.getUserrpic());
		job.put("userintros", URLEncoder.encode(artist.getUserintros(), "utf-8"));
		jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		logger.debug(jarr.toJSONString());
		response.setContentType("application/jsonl charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	//오브제 상세보기 
	@RequestMapping("objetOne.do")
	public ModelAndView selectObjetOne(@RequestParam("objetno") int objetno, ModelAndView mv) {
		Artist objet = objetService.selectObjetOne(objetno);
		if(objet != null) {
			mv.addObject("objet", objet);
			mv.setViewName("objet/objetDetail");
		}else {
			mv.addObject("objet", objet);
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	//오브제 전시감상페이지 이동
	@RequestMapping("objetView.do")
	public String objetVRView() {
		return "objet/objetView";
	}
	
	//오브제 신고
	@RequestMapping(value="objetReport.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String insertObjetReport(ReportBoard rb, Model model) {
		int result = objetService.insertObjetReport(rb);
		
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { //신고 실패시
			model.addAttribute("message", "오브제 신고 실패!");
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	/*//한줄평 삭제
	@RequestMapping("deleteReview.do")
	public String deleteReview(String userid) {
		return "objet/objetReviewDelete";
	}*/

	/*//한줄평 신고
	@RequestMapping("reviewReport.do")
	public String insertReviewReport(ReportBoard rb) {
		return "objet/objetDetail";
	}*/
	
	
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
