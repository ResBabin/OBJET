package com.kh.objet.objet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	@Autowired
	private Paging paging;
	
	
	
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
	
	//오브제, 작가 상세보기, 한줄평 리스트, 내 한줄평
	@RequestMapping("objetOne.do")
	public ModelAndView selectObjetOne(@RequestParam(value="objetno") int objetno, @RequestParam(value="userid", required=false) String userid, ModelAndView mv) {
		Artist objet = objetService.selectObjetOne(objetno);
		ArrayList<Review> reviewList = objetService.selectReview(objetno);
		
		if(userid != null) {
			ReviewKey rk = new ReviewKey(objetno, userid, null);
			Review myReview = objetService.selectReviewOne(rk);
			if(myReview != null) {
				mv.addObject("myReview", myReview);
				mv.setViewName("objet/objetDetail");
			}else {
				mv.addObject("myReview", myReview);
				mv.setViewName("common/error");
			}
		}
		
		if(objet != null && reviewList != null) {
			mv.addObject("objet", objet);
			mv.addObject("reviewList", reviewList);
			mv.setViewName("objet/objetDetail");
		}else {
			mv.addObject("objet", objet);
			mv.addObject("reviewList", reviewList);
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	//한줄평 리스트 정렬
	@RequestMapping(value="reviewOrder.do", method=RequestMethod.POST)
	public void selectReviewOrder(int no, String order, HttpServletResponse response) throws IOException {
		ReviewKey rk = new ReviewKey(no, null, order);
		ArrayList<Review> reviewListOrder = objetService.selectReviewOrder(rk);
		logger.debug(reviewListOrder.get(0).getUserid());
		logger.debug(reviewListOrder.get(1).getUserid());
		logger.debug(reviewListOrder.get(2).getUserid());
		logger.debug(reviewListOrder.get(3).getUserid());
		//전송용 json 객체
		JSONObject sendJson = new JSONObject();
		//json 배열 객체
		JSONArray jarr = new JSONArray();
		//list를 jarr 로 옮겨 저장 (복사)
		for( Review review : reviewListOrder) {
			
		JSONObject job = new JSONObject();
		job.put("userid", URLEncoder.encode(review.getUserid(), "utf-8"));
		job.put("objetno", review.getObjetno());
		job.put("revcontent", URLEncoder.encode(review.getRevcontent(), "utf-8"));
		job.put("revstars", review.getRevstars());
		job.put("revgood", review.getRevgood());
		job.put("revhate", review.getRevhate());
		job.put("revdate", review.getRevdate());
		job.put("userrpic", review.getUserrpic());
		job.put("nickname", URLEncoder.encode(review.getNickname(), "utf-8"));
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
	
	//오브제 전시감상페이지 이동
	@RequestMapping("objetView.do")
	public String objetVRView() {
		return "objet/objetView";
	}
	
	//오브제 신고
	@RequestMapping(value="objetReport.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertObjetReport(ReportBoard rb, Model model) {
		int result = objetService.insertObjetReport(rb);
		
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { //신고 실패시
			model.addAttribute("message", "오브제 신고 실패!");
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	
	/*//한줄평 등록
	@RequestMapping("reviewReport.do")
	public String insertReviewReport(ReportBoard rb) {
		return "objet/objetDetail";
	}*/
	
	/*//한줄평 수정
	@RequestMapping("reviewReport.do")
	public String insertReviewReport(ReportBoard rb) {
		return "objet/objetDetail";
	}*/
	
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
				
				List<Objet> objetlist = objetService.selectArtistObjetList(map);
						
				//가져온 객체 담기
			/*	HashMap<String, Object> result = null;
				if(objetlist.size() >= 0) {
					result = new HashMap<String,Object>();
					result.put("paging", paging);
					result.put("objetlist", objetlist);
					result.put("objetkind", "all"); //출력타입은 전체(all) 과 분류(sort)로 나뉘어져있음
				} */
				
				//전송용 json 객체
				JSONObject sendJson = new JSONObject();
				//json 배열 객체
				JSONArray jarr = new JSONArray();
				//list를 jarr 로 옮겨 저장 (복사)
				for(Objet objet : objetlist) {
				JSONObject job = new JSONObject();
				
				job.put("objetno", objet.getObjetno());
				job.put("userid", objet.getUserid());
				job.put("objettitle", URLEncoder.encode(objet.getObjettitle(), "utf-8"));
				job.put("objetintro", URLEncoder.encode(objet.getObjetintro(), "utf-8"));
				job.put("originmainposter", URLEncoder.encode(objet.getOriginmainposter(), "utf-8"));
				job.put("renamemainposter", objet.getRenamemainposter());
				job.put("objetstartdate", objet.getObjetstartdate().toString());
				job.put("objetenddate", objet.getObjetenddate().toString());
				job.put("objettag", URLEncoder.encode(objet.getObjettag(), "utf-8"));
				job.put("publicyn", objet.getPublicyn());
				job.put("objetregidate", objet.getObjetregidate().toString());
				job.put("objetstatus", objet.getObjetstatus());
				job.put("objetview", objet.getObjetview());
				jarr.add(job);
				}

				sendJson.put("objetlist", jarr);
				logger.debug(jarr.toJSONString());
				
				
				response.setContentType("application/jsonl charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(sendJson.toJSONString());
				out.flush();
				out.close();
				
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
