package com.kh.objet.objet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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

import com.google.gson.Gson;
import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.Objet2;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.objet.model.vo.ReviewUp;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;
import com.kh.objet.review.model.vo.ReviewStatus;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	@Autowired
	private Paging paging;
	
	
	public ObjetController() {}
	
	//박예은
	
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
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	//관심 오브제 추가/삭제/카운트
	@RequestMapping(value="likeobjet.do", method=RequestMethod.POST)
	public ModelAndView insertLikeObjet(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException{
		LikeObjet likeobjet = new LikeObjet(objetno, userid);
		int count = objetService.selectLikeObjetOne(likeobjet);
		ModelAndView mv = new ModelAndView();
		String resultValue = "";
		if(count==1) {
			int result2 = objetService.deleteLikeObjet(likeobjet);
			mv.addObject("count", count);
			mv.setViewName("objet/objetDetail");
			if(result2 > 0) {
				resultValue = "ok";
			}else {
				resultValue = "fail";
			}
		}else if(count == 0){
			int result1 = objetService.insertLikeObjet(likeobjet);
			mv.addObject("count", count);
			mv.setViewName("objet/objetDetail");
			if(result1 > 0) {
				resultValue = "ok2";
			}else {
				resultValue = "fail2";
			}
		}
		
		PrintWriter out = response.getWriter();
		out.append(resultValue);
		out.flush();
		out.close();
		
		return mv;
	}
	
	//오브제, 작가 상세보기, 한줄평 리스트, 내 한줄평, 관심오브제 카운트,리스트
	@RequestMapping("objetOne.do")
	public ModelAndView selectObjetOne(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid", required=false) String userid, ModelAndView mv, HttpServletResponse response) throws IOException {
		Artist objet = objetService.selectObjetOne(objetno);
		Review review = new Review(userid, objetno);
		ArrayList<Review> reviewList = objetService.selectReview(review);
		ArrayList<LikeObjet> likeobjetList = objetService.selectLikeObjet(objetno);
		
		String revgood = "";
		String revhate = "";
		String revStatus = "";
		if(userid != null) {
			ReviewKey rk = new ReviewKey(objetno, userid, null);
			ReviewStatus reviewsts = new ReviewStatus(objetno, userid);
			Review myReview = objetService.selectReviewOne(rk);
			ArrayList<ReviewStatus> reviewStatusList = objetService.selectReivewStatus(reviewsts);
			
			for(int i = 0; i < reviewStatusList.size(); i++) {
				if(reviewList.get(i).getRevgood() > 0
					&& reviewStatusList.get(i).getRevgood() == 1){
					revgood = "revgood";
				}if(reviewList.get(i).getRevhate() > 0
					&& reviewStatusList.get(i).getRevhate() == 1){
					revhate = "revhate";
				}if(reviewList.get(i).getRevhate() == 0 && reviewList.get(i).getRevgood() == 0) {
					revStatus = "norevgoodrevhate";
				}if(reviewList.get(i).getRevgood() == 0 || reviewStatusList.get(i).getRevgood() == 0){
					revStatus = "norevgood";
				}if(reviewList.get(i).getRevhate() == 0 || reviewStatusList.get(i).getRevhate() == 0){
					revStatus = "norevhate";
				}
			}
			
			if(myReview != null && reviewStatusList != null) {
				mv.addObject("myReview", myReview);
				mv.addObject("reviewStatusList", reviewStatusList);
				mv.setViewName("objet/objetDetail");
			}else {
				mv.addObject("myReview", myReview);
				mv.addObject("reviewStatusList", reviewStatusList);
				mv.setViewName("common/error");
			}
		}
		
		String resultValue = "";
		for(int i = 0; i < likeobjetList.size(); i++) {
			if(likeobjetList.get(i).getUserid().equals(userid)) {
				resultValue = "ok";
			}else {
				resultValue = "fail";
			}
		}
		
		if(objet != null && reviewList != null && likeobjetList != null && resultValue != null) {
			mv.addObject("objet", objet);
			mv.addObject("reviewList", reviewList);
			mv.addObject("likeobjetList", likeobjetList);
			mv.addObject("resultValue", resultValue);
			mv.addObject("revStatus", revStatus);
			mv.addObject("revgood", revgood);
			mv.addObject("revhate", revhate);
			mv.setViewName("objet/objetDetail");
		}else {
			mv.addObject("objet", objet);
			mv.addObject("reviewList", reviewList);
			mv.addObject("likeobjetList", likeobjetList);
			mv.addObject("resultValue", resultValue);
			mv.addObject("revStatus", revStatus);
			mv.addObject("revgood", revgood);
			mv.addObject("revhate", revhate);
			mv.setViewName("common/error");
		}
		
		
		return mv;
		
	}
	
	//한줄평 리스트 정렬
	@RequestMapping(value="reviewOrder.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void selectReviewOrder(int no, String userid, String order, HttpServletResponse response) throws IOException {
		ReviewKey rk = new ReviewKey(no, userid, order);
		ArrayList<Review> reviewListOrder = objetService.selectReviewOrder(rk);
		logger.debug(reviewListOrder.get(0).getRevuserid());
		logger.debug(reviewListOrder.get(1).getRevuserid());
		//전송용 json 객체
		JSONObject sendJson = new JSONObject();
		//json 배열 객체
		JSONArray jarr = new JSONArray();
		//list를 jarr 로 옮겨 저장 (복사)
		for(Review review : reviewListOrder) {
		JSONObject job = new JSONObject();
		job.put("revuserid", review.getRevuserid());
		job.put("revcontent", URLEncoder.encode(review.getRevcontent(), "utf-8"));
		job.put("revstars", review.getRevstars());
		job.put("revgood", review.getRevgood());
		job.put("revhate", review.getRevhate());
		job.put("revdate", review.getRevdate().toString());
		job.put("userrpic", review.getUserrpic());
		job.put("nickname", URLEncoder.encode(review.getNickname(), "utf-8"));
		jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		logger.debug(jarr.toJSONString());
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	//오브제 신고
	@RequestMapping(value="objetReport.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertObjetReport(ReportBoard rb, Model model, HttpServletResponse response)throws IOException {
		int result = objetService.insertObjetReport(rb);

		String viewFileName = "objet/objetDetail";
		if(result <= 0) { //신고 실패시
			model.addAttribute("message", "오브제 신고 실패!");
			viewFileName = "common/error";
		}else {
			response.sendRedirect("objetOne.do");
		}
		
		return viewFileName;
	}
	
	
	//한줄평 등록
	@RequestMapping(value="insertReview.do", method=RequestMethod.POST)
	public String insertReview(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid") String userid, 
			@RequestParam(value="revcontent") String revcontent, 
			@RequestParam(value="revstars") int revstars, Model model) {
		Review review = new Review(objetno, userid, revcontent, revstars);
		int result = objetService.insertReview(review);
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { //신고 실패시
			model.addAttribute("message", "한줄평 등록 실패!");
			viewFileName = "common/error";
		}
		return viewFileName;
	}
	
	//한줄평 수정
	@RequestMapping(value="updateReview.do", method=RequestMethod.POST)
	public String updateReview(@RequestParam(value="userid") String userid, 
			@RequestParam(value="revcontent") String revcontent, 
			@RequestParam(value="revstars") int revstars, 
			Model model) {
		ReviewUp review = new ReviewUp(userid, revcontent, revstars);
		int result = objetService.updateReview(review);
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { //신고 실패시
			model.addAttribute("message", "한줄평 수정 실패!");
			viewFileName = "common/error";
		}
		return viewFileName;
	}
	
	//한줄평 삭제
	@RequestMapping(value="deleteReview.do")
	public String deleteReview(@RequestParam(value="userid") String userid, 
			@RequestParam(value="objetno") int objetno, Model model) {
		Review review = new Review(userid, objetno);
		int result = objetService.deleteReview(review);
		String viewFileName = "objet/objetDetail";
		if(result <= 0) {
			model.addAttribute("message", "한줄평 삭제 실패!");
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//한줄평 신고
	@RequestMapping(value="reviewReport.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void insertReviewReport(@RequestParam(value="originno") int originno, @RequestParam(value="reportedb") String reportedb,
			@RequestParam(value="reporterb") String reporterb, @RequestParam(value="reportbtype") String reportbtype, 
			@RequestParam(value="reportbreason") String reportbreason, HttpServletResponse response) throws IOException{
		
		ReportBoard rbb = new ReportBoard(originno, reportedb, reporterb);
		int result2 = objetService.selectReviewReport(rbb);

		String resultValue = "";
		if(result2 == 0) {
			ReportBoard rb = new ReportBoard(originno, reportedb, reporterb, reportbtype, reportbreason);
			int result = objetService.insertReviewReport(rb);
			if(result > 0) { 
				resultValue = "ok";
			}else {
				resultValue = "fail";
			}
		}else if(result2 == 1) {
			resultValue = "fail";
		}
		
		
		
		PrintWriter out = response.getWriter();
		out.append(resultValue);
		out.flush();
		out.close();
	}
	
	//한줄평 좋아요/좋아요 취소/좋아요 체크
	@RequestMapping(value="insertRevGood.do", method={RequestMethod.GET, RequestMethod.POST})
	public void insertRevGood(@RequestParam(value="revuserid") String revuserid,
			@RequestParam(value="objetno") int objetno, @RequestParam(value="userid") String userid, 
			HttpServletResponse response) throws IOException{
		ReviewStatus revstatus = new ReviewStatus(revuserid, objetno, userid);//작성자아이디, 오브제번호, 평가자아이디
		int revgoodcount = objetService.selectRevGoodChk(revstatus);
		int revhatecount = objetService.selectRevHateChk(revstatus);
		String resultValue = "";
		if(revgoodcount == 1 && revhatecount == 0 && !(revuserid.equals(userid))) {
			int revgoodreset = objetService.deleteRevGood(revstatus);
			if(revgoodreset > 0) {
				resultValue = "revgoodcancel";
			}else {
				resultValue = "fail";
			}
		}else if(revgoodcount == 0 && revhatecount == 0 && !(revuserid.equals(userid))){
			ReviewStatus revstatus2 = new ReviewStatus(revuserid, objetno, userid, 1);//작성자아이디, 오브제번호, 평가자아이디, 좋아요 갯수
			int revgood = objetService.insertRevGood(revstatus2);
			if(revgood > 0) {
				resultValue = "revgood";
			}else {
				resultValue = "fail2";
			}
		}else if(revgoodcount >= 1 && revhatecount >= 1) {
			int revgoodreset = objetService.deleteRevGood(revstatus);
			int revhatereset = objetService.deleteRevHate(revstatus);
			if(revgoodreset > 0 && revhatereset > 0) {
				resultValue = "revgoodhatecancel";
			}else {
				resultValue = "fail3";
			}
		}else if(revuserid.equals(userid) && revgoodcount == 0 && revhatecount == 0) {
			resultValue = "sameuserid";
		}else if(revgoodcount == 0 && revhatecount == 1 && !(revuserid.equals(userid))) {
			ReviewStatus revstatus2 = new ReviewStatus(revuserid, objetno, userid, 1);//작성자아이디, 오브제번호, 평가자아이디, 좋아요 갯수
			int revhatereset = objetService.deleteRevHate(revstatus);
			int revgood = objetService.insertRevGood(revstatus2);
			if(revhatereset > 0 && revgood > 0) {
				resultValue = "revgoodrevhatecancel";
			}else {
				resultValue = "fail4";
			}
		}
		
		PrintWriter out = response.getWriter();
		out.append(resultValue);
		out.flush();
		out.close();
	}
	
	//한줄평 싫어요/싫어요 취소/싫어요 체크
	@RequestMapping(value="insertRevHate.do", method={RequestMethod.GET, RequestMethod.POST})
	public void insertRevHate(@RequestParam(value="revuserid") String revuserid,
			@RequestParam(value="objetno") int objetno, @RequestParam(value="userid") String userid, 
			HttpServletResponse response) throws IOException{
		ReviewStatus revstatus = new ReviewStatus(revuserid, objetno, userid);//작성자아이디, 오브제번호, 평가자아이디
		int revgoodcount = objetService.selectRevGoodChk(revstatus);
		int revhatecount = objetService.selectRevHateChk(revstatus);
		String resultValue = "";
		if(revgoodcount == 0 && revhatecount == 1 && !(revuserid.equals(userid))) {
			int revhatereset = objetService.deleteRevHate(revstatus);
			if(revhatereset > 0) {
				resultValue = "revhatecancel";
			}else {
				resultValue = "fail";
			}
		}else if(revgoodcount == 0 && revhatecount == 0 && !(revuserid.equals(userid))){
			ReviewStatus revstatus2 = new ReviewStatus(1, objetno, userid, revuserid);//작성자아이디, 오브제번호, 평가자아이디, 좋아요 갯수
			int revhate = objetService.insertRevHate(revstatus2);
			if(revhate > 0) {
				resultValue = "revhate";
			}else {
				resultValue = "fail2";
			}
		}else if(revgoodcount >= 1 && revhatecount >= 1) {
			int revgoodreset = objetService.deleteRevGood(revstatus);
			int revhatereset = objetService.deleteRevHate(revstatus);
			if(revgoodreset > 0 && revhatereset > 0) {
				resultValue = "revgoodhatecancel";
			}else {
				resultValue = "fail3";
			}
		}else if(revuserid.equals(userid) && revgoodcount == 0 && revhatecount == 0) {
			resultValue = "sameuserid";
		}else if(revgoodcount == 1 && revhatecount == 0 && !(revuserid.equals(userid))) {
			ReviewStatus revstatus2 = new ReviewStatus(1, objetno, userid, revuserid);
			int revgoodreset = objetService.deleteRevGood(revstatus);
			int revhate = objetService.insertRevHate(revstatus2);
			if(revgoodreset > 0 && revhate > 0) {
				resultValue = "revgoodrevhatecancel";
			}else {
				resultValue = "fail4";
			}
		}
		
		PrintWriter out = response.getWriter();
		out.append(resultValue);
		out.flush();
		out.close();
	}
	
	
	// 최민영 *******************************************************************************
	// 작가홈 오브제 전체 리스트 보기
			@RequestMapping(value= "selectArtistObjetList.do", method=RequestMethod.POST)
			public void selectArtistObjetList(@RequestParam("userid") String userid, HttpServletResponse response) throws IOException {
				
				
				List<Objet2> objetlist = objetService.selectArtistObjetList(userid);

				//전송용 json 객체
				JSONObject sendJson = new JSONObject();
				//json 배열 객체
				JSONArray jarr = new JSONArray();
				//list를 jarr 로 옮겨 저장 (복사)
				for(Objet2 objet : objetlist) {
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
				objet.setLikecount(objetService.selectlikecount(objet.getObjetno()));
				job.put("likecount", objet.getLikecount());
				objet.setReviewcount(objetService.selectreviewcount(objet.getObjetno()));
				job.put("reviewcount", objet.getReviewcount());
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
			@RequestMapping(value="selectArtistObjetSearch.do", method=RequestMethod.POST)
			public void selectArtistObjetSearch(@RequestParam(value="userid") String userid, @RequestParam(value="keyword") String keyword, HttpServletResponse response) throws IOException {
				// HashMap 객체 생성
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("userid", userid); // 대상 아티스트 아이디
				map.put("objettitle", keyword);
				
				List<Objet2> objetlist = objetService.selectArtistObjetSearch(map);
				
				//전송용 json 객체
				JSONObject sendJson = new JSONObject();
				//json 배열 객체
				JSONArray jarr = new JSONArray();
				//list를 jarr 로 옮겨 저장 (복사)
				for(Objet2 objet : objetlist) {
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
				objet.setLikecount(objetService.selectlikecount(objet.getObjetno()));
				job.put("likecount", objet.getLikecount());
				objet.setReviewcount(objetService.selectreviewcount(objet.getObjetno()));
				job.put("reviewcount", objet.getReviewcount());
				
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

			
	
	// 오브제 관리-내 오브제 페이지 이동
		@RequestMapping("moveMyObjetList.do")
		public String moveMyObjetList() {
			return "objet/myObjetList";
		}
		
	// 오브제 관리-내 오브제 검색
		@RequestMapping("selectMyObjetSearch.do")
		public void selectMyObjetSearch(@RequestParam(value="publicyn") String publicyn, @RequestParam(value="objetstatus") String objetstatus, 
				@RequestParam(value="objettitle") String objettitle, HttpServletResponse response) throws IOException {
			
			HashMap<String, Object> map =new HashMap<String, Object>();  
			
			map.put("publicyn", publicyn);
			map.put("objetstatus", objetstatus);
			map.put("objettitle", objettitle);
			
			List<Objet> objetList = objetService.selectMyObjetSearch(map);
			
			//전송용 JSON 객체
			JSONObject sendJson = new JSONObject();
			
			//JSON 배열 객체
			JSONArray jarr = new JSONArray();
			
			//list를 jarr 로 옮겨 저장 (복사)
			for(Objet objet : objetList) {
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
			
			sendJson.put("objetList", jarr);
			
			
			logger.debug(jarr.toJSONString());
			
			
			response.setContentType("application/jsonl charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(sendJson.toJSONString());
			out.flush();
			out.close();
			
		}
	
	//오브제 관리 - 내 오브제 상세보기
		@RequestMapping("moveMyObjetDetail.do")
		public ModelAndView moveMyObjetDetail(@RequestParam(value="objetno") int objetno, ModelAndView mv) {
			return mv;
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
