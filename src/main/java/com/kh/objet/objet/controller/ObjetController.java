package com.kh.objet.objet.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.Objet2;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;
import com.kh.objet.review.model.vo.ReviewStatus;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

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
	@RequestMapping(value="search.do")
	public String selectObjetAllSearch(@RequestParam(value="keyword") String keyword, Model model, HttpServletResponse response) throws IOException {
		
		ArrayList<Artist> searchobjetList = objetService.selectObjetAllSearch(keyword);
		ArrayList<Artist> searchartistList = objetService.selectArtistAllSearch(keyword);
		ArrayList<Integer> likeobjetcntList = new ArrayList<Integer>();
		ArrayList<Integer> reviewcntList = new ArrayList<Integer>();
		
		if(searchobjetList != null) {
			for(int i = 0; i < searchobjetList.size(); i++) {
				likeobjetcntList.add(objetService.selectLikeObjetCnt(searchobjetList.get(i).getObjetno()));
				reviewcntList.add(objetService.selectReviewCnt(searchobjetList.get(i).getObjetno()));
				if(likeobjetcntList != null && likeobjetcntList != null) {
					model.addAttribute("likeobjetcntList", likeobjetcntList);
					model.addAttribute("reviewcntList", reviewcntList);
				}
			}
		}
		
		ArrayList<Integer> objetcntList = new ArrayList<Integer>();
		ArrayList<Integer> followercntList = new ArrayList<Integer>();
		ArrayList<String> objetstatusList = new ArrayList<String>();
		if(searchartistList != null) {
			for(int i = 0; i < searchartistList.size(); i++) {
				objetcntList.add(objetService.selectObjetCnt(searchartistList.get(i).getUserid()));
				followercntList.add(objetService.selectFollowerCnt(searchartistList.get(i).getUserid()));
				objetstatusList.add(objetService.selectArtistObjetStatus(searchartistList.get(i).getUserid()));
				if(objetcntList != null && followercntList != null && objetstatusList != null) {
					model.addAttribute("objetcntList", objetcntList);
					model.addAttribute("followercntList", followercntList);
					model.addAttribute("objetstatusList", objetstatusList);
				}
			}
		}
		
		if(searchobjetList != null && searchartistList != null) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("searchobjetList", searchobjetList);
			model.addAttribute("searchartistList", searchartistList);
		}
		
		return "objet/searchList";
	}
	
	//오브제 전시 검색 정렬
	@RequestMapping(value="objetSearchOrder.do", method=RequestMethod.POST)
	public void selectObjetSearchOrder(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String keyword = request.getParameter("keyword");
		map.put("order", order);
		map.put("keyword", keyword);
		
		ArrayList<Artist> objetSearchOrder = (ArrayList<Artist>)objetService.selectObjetSearchOrder(map);
		ArrayList<Integer> likeobjetcntList = new ArrayList<Integer>();
		ArrayList<Integer> reviewcntList = new ArrayList<Integer>();
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(int i = 0; i < objetSearchOrder.size(); i++) {
		likeobjetcntList.add(objetService.selectLikeObjetCnt(objetSearchOrder.get(i).getObjetno()));
		reviewcntList.add(objetService.selectReviewCnt(objetSearchOrder.get(i).getObjetno()));
		JSONObject job = new JSONObject();
		job.put("objetno", objetSearchOrder.get(i).getObjetno());
		job.put("objettitle", URLEncoder.encode(objetSearchOrder.get(i).getObjettitle(), "utf-8"));
		job.put("objetstatus", objetSearchOrder.get(i).getObjetstatus());
		job.put("objetstartdate", objetSearchOrder.get(i).getObjetstartdate().toString());
		job.put("objetenddate", objetSearchOrder.get(i).getObjetenddate().toString());
		job.put("renamemainposter", objetSearchOrder.get(i).getRenamemainposter());
		job.put("objetintro", URLEncoder.encode(objetSearchOrder.get(i).getObjetintro(), "utf-8"));
		job.put("nickname", URLEncoder.encode(objetSearchOrder.get(i).getNickname(), "utf-8"));
		job.put("objettag", URLEncoder.encode(objetSearchOrder.get(i).getObjettag(), "utf-8"));
		job.put("likeobjetcnt", likeobjetcntList.get(i));
		job.put("reviewcnt", reviewcntList.get(i));
		jarr.add(job);
		}
			
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	//오브제 전시 기간 검색 정렬
	@RequestMapping(value="objetDateSearchOrder.do", method=RequestMethod.POST)
	public void objetDateSearchOrder(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String keyword = request.getParameter("keyword");
		map.put("order", order);
		map.put("keyword", keyword);
		
		ArrayList<Artist> objetDateSearchOrder = (ArrayList<Artist>)objetService.selectObjetDateSearchOrder(map);
		ArrayList<Integer> likeobjetcntList = new ArrayList<Integer>();
		ArrayList<Integer> reviewcntList = new ArrayList<Integer>();
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(int i = 0; i < objetDateSearchOrder.size(); i++) {
		likeobjetcntList.add(objetService.selectLikeObjetCnt(objetDateSearchOrder.get(i).getObjetno()));
		reviewcntList.add(objetService.selectReviewCnt(objetDateSearchOrder.get(i).getObjetno()));
		JSONObject job = new JSONObject();
		job.put("objetno", objetDateSearchOrder.get(i).getObjetno());
		job.put("objettitle", URLEncoder.encode(objetDateSearchOrder.get(i).getObjettitle(), "utf-8"));
		job.put("objetstatus", objetDateSearchOrder.get(i).getObjetstatus());
		job.put("objetstartdate", objetDateSearchOrder.get(i).getObjetstartdate().toString());
		job.put("objetenddate", objetDateSearchOrder.get(i).getObjetenddate().toString());
		job.put("renamemainposter", objetDateSearchOrder.get(i).getRenamemainposter());
		job.put("objetintro", URLEncoder.encode(objetDateSearchOrder.get(i).getObjetintro(), "utf-8"));
		job.put("nickname", URLEncoder.encode(objetDateSearchOrder.get(i).getNickname(), "utf-8"));
		job.put("objettag", URLEncoder.encode(objetDateSearchOrder.get(i).getObjettag(), "utf-8"));
		job.put("likeobjetcnt", likeobjetcntList.get(i));
		job.put("reviewcnt", reviewcntList.get(i));
		jarr.add(job);
		}
			
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	//아티스트 검색 정렬
	@RequestMapping(value="artistSearchOrder.do", method=RequestMethod.POST)
	public void selectArtistSearchOrder(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String keyword = request.getParameter("keyword");
		map.put("order", order);
		map.put("keyword", keyword);
		
		ArrayList<Artist> artistSearchOrder = (ArrayList<Artist>)objetService.selectArtistSearchOrder(map);
		ArrayList<Integer> objetcntList = new ArrayList<Integer>();
		ArrayList<Integer> followercntList = new ArrayList<Integer>();
		ArrayList<String> objetstatusList = new ArrayList<String>();
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(int i = 0; i < artistSearchOrder.size(); i++) {
		objetcntList.add(objetService.selectObjetCnt(artistSearchOrder.get(i).getUserid()));
		followercntList.add(objetService.selectFollowerCnt(artistSearchOrder.get(i).getUserid()));
		objetstatusList.add(objetService.selectArtistObjetStatus(artistSearchOrder.get(i).getUserid()));
		JSONObject job = new JSONObject();
		job.put("userid", artistSearchOrder.get(i).getUserid());
		job.put("userintrol", URLEncoder.encode(artistSearchOrder.get(i).getUserintrol(), "utf-8"));
		job.put("usertag", URLEncoder.encode(artistSearchOrder.get(i).getUsertag(), "utf-8"));
		job.put("nickname", URLEncoder.encode(artistSearchOrder.get(i).getNickname(), "utf-8"));
		job.put("userrpic", artistSearchOrder.get(i).getUserrpic());
		job.put("userintros", URLEncoder.encode(artistSearchOrder.get(i).getUserintros(), "utf-8"));
		job.put("objetcnt", objetcntList.get(i));
		job.put("followercnt", followercntList.get(i));
		job.put("objetstatus", objetstatusList.get(i));
		jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
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
		job.put("userid", artist.getUserid());
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
	
	//전시일정
	@RequestMapping(value="objetOnePlan.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectObjetCalendar(@RequestParam(value="objetno") int objetno, HttpServletResponse response) throws IOException {
		List<Objet> objetPlanList = objetService.selectObjetCalendar(objetno);
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(Objet objet : objetPlanList) {
		JSONObject job = new JSONObject();
		job.put("title", URLEncoder.encode(objet.getObjettitle(), "utf-8"));
		job.put("start", objet.getObjetstartdate().toString());
		job.put("end", objet.getObjetenddate().toString());
		job.put("color", objet.getObjetcolor());
		jarr.add(job);
		}
		
		sendJson.put("plan", jarr);
		logger.debug(jarr.toJSONString());
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	
	//오브제, 작가 상세보기, 한줄평 리스트, 내 한줄평, 관심오브제 카운트,리스트
	@RequestMapping("objetOne.do")
	public ModelAndView selectObjetOne(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid", required=false) String userid, ModelAndView mv, HttpServletResponse response) throws IOException {
		Artist objet = objetService.selectObjetOne(objetno);
		Review review = new Review(userid, objetno);
		ArrayList<Review> reviewList = objetService.selectReview(review);
		ArrayList<LikeObjet> likeobjetList = objetService.selectLikeObjet(objetno);
		
		if(userid != null) {
			ReviewKey rk = new ReviewKey(objetno, userid, null);
			Review myReview = objetService.selectReviewOne(rk);
			Review myReviewStatus = objetService.selectReviewStatusOne(rk);
			List<ReviewStatus> reviewStatusChk = objetService.selectReviewStatusChk(rk);
			
			if(myReview != null && myReviewStatus != null && reviewStatusChk != null) {
				mv.addObject("myReview", myReview);
				mv.addObject("myReviewStatus", myReviewStatus);
				mv.addObject("reviewStatusChk", reviewStatusChk);
				mv.setViewName("objet/objetDetail");
			}else {
				mv.addObject("myReview", myReview);
				mv.addObject("myReviewStatus", myReviewStatus);
				mv.addObject("reviewStatusChk", reviewStatusChk);
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
			mv.setViewName("objet/objetDetail");
		}else {
			mv.addObject("objet", objet);
			mv.addObject("reviewList", reviewList);
			mv.addObject("likeobjetList", likeobjetList);
			mv.addObject("resultValue", resultValue);
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	//다녀온 오브제 추가
	@RequestMapping("insertVisitedObjet.do")
	public void insertVisitedObjet(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException {
		VisitedObjet vs = new VisitedObjet(objetno, userid, null);
		int selectvs = objetService.selectVisitedObjet(vs);
		String resultValue = "";
		if(selectvs == 0) {
			int result = objetService.insertVisitedObjet(vs);
			if(result > 0) {
				resultValue = "ok";
			}else {
				resultValue = "fail";
			}
		}else {
			resultValue = "move";
		}
		
		PrintWriter out = response.getWriter();
		out.append(resultValue);
		out.flush();
		out.close();
	}
	
	//오브제 전시 감상 뷰
	@RequestMapping(value="objetView.do")
	public String selectObjetView(@RequestParam(value="objetno") int objetno, 
			@RequestParam(value="userid", required=false) String userid, Model model) {
		
		Artist objet = objetService.selectObjetOne(objetno);
		int followercnt = objetService.selectFollowerCnt(userid);
		int followingcnt = objetService.selectFollowingCnt(userid);
		if(objet != null && followercnt >= 0 && followingcnt >= 0) {
			model.addAttribute("objet", objet);
			model.addAttribute("followercnt", followercnt);
			model.addAttribute("followingcnt", followingcnt);
		}
		
		return "objet/objetView";
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
		Review review = new Review(userid, objetno, revcontent, revstars);
		int result = objetService.insertReview(review);
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { 
			model.addAttribute("message", "한줄평 등록 실패!");
			viewFileName = "common/error";
		}
		return viewFileName;
	}
	
	//한줄평 수정
	@RequestMapping(value="updateReview.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String updateReview(@RequestParam(value="userid") String userid, 
			@RequestParam(value="objetno") int objetno,
			@RequestParam(value="revcontent") String revcontent, 
			@RequestParam(value="revstars") int revstars, 
			Model model) {
		Review review = new Review(userid, objetno, revcontent, revstars);
		int result = objetService.updateReview(review);
		String viewFileName = "objet/objetDetail";
		if(result <= 0) { 
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
	
	//내 오브제 상세보기
	@RequestMapping(value="moveMyObjetList.do")
	public String selectMyObjetList(@RequestParam(value="userid") String userid, @RequestParam("currentPage") String currentPage, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		int listCount = objetService.selectMyObjetListCount(userid);
		paging.makePage(listCount, curPage);
				
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("userid", userid);
		
		List<Artist> list = objetService.selectMyObjetList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "all");
		
		return "objet/myObjetList";
	}
	
	//내 오브제 상세보기 검색
	@RequestMapping(value="moveMyObjetListSearch.do", method=RequestMethod.POST)
	public String selectMyObjetListSearch(@RequestParam(value="userid") String userid, 
		@RequestParam("publicyn") String publicyn, 
		@RequestParam("objetstatus") String objetstatus,
		@RequestParam("objettitle") String objettitle,
		@RequestParam("currentPage") String currentPage, Model model) {

		int curPage = Integer.valueOf(currentPage);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("userid", userid);
		map.put("publicyn", publicyn);
		map.put("objetstatus", objetstatus);
		map.put("objettitle", objettitle);
		
		int listCount = objetService.selectMyObjetListSearchCount(map);
		paging.makePage(listCount, curPage);
		List<Artist> list = objetService.selectMyObjetListSearch(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "search");
		model.addAttribute("publicyn", publicyn);
		model.addAttribute("objetstatus", objetstatus);
		model.addAttribute("objettitle", objettitle);
		
		return "objet/myObjetList";
	}

	//내 오브제 등록
	@RequestMapping(value="insertMyObjet.do", method=RequestMethod.POST)
	public ModelAndView insertMyObjet(@RequestParam(value="userid") String userid,
	 @RequestParam("originmainposter") MultipartFile originmainposter,
	 @RequestParam("objetofile1") MultipartFile objetofile1,
	 @RequestParam("objetofile2") MultipartFile objetofile2,
	 @RequestParam("objetofile3") MultipartFile objetofile3,
	 @RequestParam("objetofile4") MultipartFile objetofile4,
	 @RequestParam("objetofile5") MultipartFile objetofile5,
	 @RequestParam("objetofile6") MultipartFile objetofile6,
	 @RequestParam("objetofile7") MultipartFile objetofile7,
	 @RequestParam("objetofile8") MultipartFile objetofile8, 
	 MultipartHttpServletRequest request, ModelAndView mav) throws Exception {
		
		Objet objet = new Objet();
		objet.setUserid(userid);
		objet.setObjettitle(request.getParameter("objettitle"));
		objet.setObjetintro(request.getParameter("objetintro"));
		String originmainpostername = originmainposter.getOriginalFilename();
		objet.setOriginmainposter(originmainpostername);
		objet.setObjetstartdate(Date.valueOf(request.getParameter("objetstartdate")));
		objet.setObjetenddate(Date.valueOf(request.getParameter("objetenddate")));
		String[] tags = request.getParameterValues("objettag");
		String tag = String.join("," , tags);
		objet.setObjettag(tag);
		
		objet.setObjettitle1(request.getParameter("objettitle1"));
		objet.setObjetintro1(request.getParameter("objetintro1"));
		String objetofile1name = objetofile1.getOriginalFilename();
		objet.setObjetofile1(objetofile1name);
		
		objet.setObjettitle2(request.getParameter("objettitle2"));
		objet.setObjetintro2(request.getParameter("objetintro2"));
		String objetofile2name = objetofile2.getOriginalFilename();
		objet.setObjetofile2(objetofile2name);
		
		objet.setObjettitle3(request.getParameter("objettitle3"));
		objet.setObjetintro3(request.getParameter("objetintro3"));
		String objetofile3name = objetofile3.getOriginalFilename();
		objet.setObjetofile3(objetofile3name);
		
		objet.setObjettitle4(request.getParameter("objettitle4"));
		objet.setObjetintro4(request.getParameter("objetintro4"));
		String objetofile4name = objetofile4.getOriginalFilename();
		objet.setObjetofile4(objetofile4name);
		
		objet.setObjettitle5(request.getParameter("objettitle5"));
		objet.setObjetintro5(request.getParameter("objetintro5"));
		String objetofile5name = objetofile5.getOriginalFilename();
		objet.setObjetofile5(objetofile5name);
		
		objet.setObjettitle6(request.getParameter("objettitle6"));
		objet.setObjetintro6(request.getParameter("objetintro6"));
		String objetofile6name = objetofile6.getOriginalFilename();
		objet.setObjetofile6(objetofile6name);
		
		objet.setObjettitle7(request.getParameter("objettitle7"));
		objet.setObjetintro7(request.getParameter("objetintro7"));
		String objetofile7name = objetofile7.getOriginalFilename();
		objet.setObjetofile7(objetofile7name);
		
		objet.setObjettitle8(request.getParameter("objettitle8"));
		objet.setObjetintro8(request.getParameter("objetintro8"));
		String objetofile8name = objetofile8.getOriginalFilename();
		objet.setObjetofile8(objetofile8name);
		
		String path = request.getSession().getServletContext().getRealPath("resources/images/objet");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMDD_HHMMSS_");
		Calendar now = Calendar.getInstance();
        String extension1 = originmainpostername.split("\\.")[1];
        String renamemainpostername = sdf.format(now.getTime())+"1."+extension1;
        File f1 = new File(path + "\\" + renamemainpostername);
        originmainposter.transferTo(f1);
        
        String extension2 = objetofile1name.split("\\.")[1];
        String objetrfile1name = sdf.format(now.getTime())+"2."+extension2;
        File f2 = new File(path + "\\" + objetrfile1name);
        objetofile1.transferTo(f2);
        
        String extension3 = objetofile2name.split("\\.")[1];
        String objetrfile2name = sdf.format(now.getTime())+"3."+extension3;
        File f3 = new File(path + "\\" + objetrfile2name);
        objetofile2.transferTo(f3);
        
        String extension4 = objetofile3name.split("\\.")[1];
        String objetrfile3name = sdf.format(now.getTime())+"4."+extension4;
        File f4 = new File(path + "\\" + objetrfile3name);
        objetofile3.transferTo(f4);
        
        String extension5 = objetofile4name.split("\\.")[1];
        String objetrfile4name = sdf.format(now.getTime())+"5."+extension5;
        File f5 = new File(path + "\\" + objetrfile4name);
        objetofile4.transferTo(f5);
        
        String extension6 = objetofile5name.split("\\.")[1];
        String objetrfile5name = sdf.format(now.getTime())+"6."+extension6;
        File f6 = new File(path + "\\" + objetrfile5name);
        objetofile5.transferTo(f6);
        
        String extension7 = objetofile6name.split("\\.")[1];
        String objetrfile6name = sdf.format(now.getTime())+"7."+extension7;
        File f7 = new File(path + "\\" + objetrfile6name);
        objetofile6.transferTo(f7);
        
        String extension8 = objetofile7name.split("\\.")[1];
        String objetrfile7name = sdf.format(now.getTime())+"8."+extension8;
        File f8 = new File(path + "\\" + objetrfile7name);
        objetofile7.transferTo(f8);
        
        String extension9 = objetofile8name.split("\\.")[1];
        String objetrfile8name = sdf.format(now.getTime())+"9."+extension9;
        File f9 = new File(path + "\\" + objetrfile8name);
        objetofile8.transferTo(f9);
		
        objet.setRenamemainposter(renamemainpostername);
        objet.setObjetrfile1(objetrfile1name);
        objet.setObjetrfile2(objetrfile2name);
        objet.setObjetrfile3(objetrfile3name);
        objet.setObjetrfile4(objetrfile4name);
        objet.setObjetrfile5(objetrfile5name);
        objet.setObjetrfile6(objetrfile6name);
        objet.setObjetrfile7(objetrfile7name);
        objet.setObjetrfile8(objetrfile8name);
        objet.setObjetcolor(request.getParameter("objetcolor"));
        
		int result = objetService.insertMyObjet(objet);
        
        if (result > 0) {
        	mav.setViewName("redirect:moveMyObjetList.do?userid=" + userid + "&currentPage=1");
    	} else {
    		mav.addObject("message", "오브제 등록 실패");
    		mav.setViewName("common/errorPage");
    	}
        
        return mav;
	}
	
	//오브제 관리 - 내 오브제 수정 페이지 이동
	@RequestMapping("moveEditObjet.do")
	public String moveEditObjet(@RequestParam(value="objetno") int objetno, Model model) {
		Artist objet = objetService.selectObjetOne(objetno);
		if(objet != null) {
			model.addAttribute("objet", objet);
		}
		return "objet/editObjet";
	}
	
	//내 오브제 수정
	@RequestMapping(value="updateMyObjet.do", method=RequestMethod.POST)
	public ModelAndView updateMyObjet(@RequestParam(value="userid") String userid,
	 @RequestParam(value="objetno") int objetno,
	 @RequestParam(value="originmainposter", required=false) MultipartFile originmainposter,
	 @RequestParam(value="objetofile1", required=false) MultipartFile objetofile1,
	 @RequestParam(value="objetofile2", required=false) MultipartFile objetofile2,
	 @RequestParam(value="objetofile3", required=false) MultipartFile objetofile3,
	 @RequestParam(value="objetofile4", required=false) MultipartFile objetofile4,
	 @RequestParam(value="objetofile5", required=false) MultipartFile objetofile5,
	 @RequestParam(value="objetofile6", required=false) MultipartFile objetofile6,
	 @RequestParam(value="objetofile7", required=false) MultipartFile objetofile7,
	 @RequestParam(value="objetofile8", required=false) MultipartFile objetofile8, 
	 MultipartHttpServletRequest request, ModelAndView mav) throws Exception {
		
		Objet objet = new Objet();
		
		objet.setObjetno(objetno);
		objet.setUserid(userid);
		objet.setObjettitle(request.getParameter("objettitle"));
		objet.setObjetintro(request.getParameter("objetintro"));
		objet.setObjetstartdate(Date.valueOf(request.getParameter("objetstartdate")));
		objet.setObjetenddate(Date.valueOf(request.getParameter("objetenddate")));
		String[] tags = request.getParameterValues("objettag");
		String tag = String.join("," , tags);
		objet.setObjettag(tag);
		objet.setObjetcolor(request.getParameter("objetcolor"));
		
		String path = request.getSession().getServletContext().getRealPath("resources/images/objet");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMDD_HHMMSS_");
		Calendar now = Calendar.getInstance();
		
		if(originmainposter != null) {
			String originmainpostername = originmainposter.getOriginalFilename();
			objet.setOriginmainposter(originmainpostername);
			String extension1 = originmainpostername.split("\\.")[1];
	        String renamemainpostername = sdf.format(now.getTime())+"1."+extension1;
	        File f1 = new File(path + "\\" + renamemainpostername);
	        originmainposter.transferTo(f1);
	        objet.setRenamemainposter(renamemainpostername);
		}
        
		objet.setObjettitle1(request.getParameter("objettitle1"));
		objet.setObjetintro1(request.getParameter("objetintro1"));
		if(objetofile1 != null) {
			String objetofile1name = objetofile1.getOriginalFilename();
			if(!objetofile1name.equals("")) {
				objet.setObjetofile1(objetofile1name);
				String extension2 = objetofile1name.split("\\.")[1];
		        String objetrfile1name = sdf.format(now.getTime())+"2."+extension2;
		        File f2 = new File(path + "\\" + objetrfile1name);
		        objetofile1.transferTo(f2);
		        objet.setObjetrfile1(objetrfile1name);
			}
		}
		
		objet.setObjettitle2(request.getParameter("objettitle2"));
		objet.setObjetintro2(request.getParameter("objetintro2"));
		if(objetofile2 != null) {
			String objetofile2name = objetofile2.getOriginalFilename();
			if(!objetofile2name.equals("")) {
				objet.setObjetofile2(objetofile2name);
				String extension3 = objetofile2name.split("\\.")[1];
		        String objetrfile2name = sdf.format(now.getTime())+"3."+extension3;
		        File f3 = new File(path + "\\" + objetrfile2name);
		        objetofile2.transferTo(f3);
		        objet.setObjetrfile2(objetrfile2name);
			}
		}
		
		objet.setObjettitle3(request.getParameter("objettitle3"));
		objet.setObjetintro3(request.getParameter("objetintro3"));
		if(objetofile3 != null) {
			String objetofile3name = objetofile3.getOriginalFilename();
			if(!objetofile3name.equals("")) {
				objet.setObjetofile3(objetofile3name);
		        String extension4 = objetofile3name.split("\\.")[1];
		        String objetrfile3name = sdf.format(now.getTime())+"4."+extension4;
		        File f4 = new File(path + "\\" + objetrfile3name);
		        objetofile3.transferTo(f4);
		        objet.setObjetrfile3(objetrfile3name);
			}
		}
		
		objet.setObjettitle4(request.getParameter("objettitle4"));
		objet.setObjetintro4(request.getParameter("objetintro4"));
		if(objetofile4 != null) {
			String objetofile4name = objetofile4.getOriginalFilename();
			if(!objetofile4name.equals("")) {
				objet.setObjetofile4(objetofile4name);
				String extension5 = objetofile4name.split("\\.")[1];
		        String objetrfile4name = sdf.format(now.getTime())+"5."+extension5;
		        File f5 = new File(path + "\\" + objetrfile4name);
		        objetofile4.transferTo(f5);
		        objet.setObjetrfile4(objetrfile4name);
			}
		}
		
		objet.setObjettitle5(request.getParameter("objettitle5"));
		objet.setObjetintro5(request.getParameter("objetintro5"));
		if(objetofile5 != null) {
			String objetofile5name = objetofile5.getOriginalFilename();
			if(!objetofile5name.equals("")) {
				objet.setObjetofile5(objetofile5name);
				String extension6 = objetofile5name.split("\\.")[1];
		        String objetrfile5name = sdf.format(now.getTime())+"6."+extension6;
		        File f6 = new File(path + "\\" + objetrfile5name);
		        objetofile5.transferTo(f6);
		        objet.setObjetrfile5(objetrfile5name);
			}
		}
		
		objet.setObjettitle6(request.getParameter("objettitle6"));
		objet.setObjetintro6(request.getParameter("objetintro6"));
		if(objetofile6 != null) {
			String objetofile6name = objetofile6.getOriginalFilename();
			if(!objetofile6name.equals("")) {
				objet.setObjetofile6(objetofile6name);
				String extension7 = objetofile6name.split("\\.")[1];
		        String objetrfile6name = sdf.format(now.getTime())+"7."+extension7;
		        File f7 = new File(path + "\\" + objetrfile6name);
		        objetofile6.transferTo(f7);
		        objet.setObjetrfile6(objetrfile6name);
			}
		}
		
		objet.setObjettitle7(request.getParameter("objettitle7"));
		objet.setObjetintro7(request.getParameter("objetintro7"));
		if(objetofile7 != null) {
			String objetofile7name = objetofile7.getOriginalFilename();
			if(!objetofile7name.equals("")) {
				objet.setObjetofile7(objetofile7name);
				String extension8 = objetofile7name.split("\\.")[1];
		        String objetrfile7name = sdf.format(now.getTime())+"8."+extension8;
		        File f8 = new File(path + "\\" + objetrfile7name);
		        objetofile7.transferTo(f8);
		        objet.setObjetrfile7(objetrfile7name);
			}
		}
		
		objet.setObjettitle8(request.getParameter("objettitle8"));
		objet.setObjetintro8(request.getParameter("objetintro8"));
		if(objetofile8 != null) {
			String objetofile8name = objetofile8.getOriginalFilename();
			if(!objetofile8name.equals("")) {
				objet.setObjetofile8(objetofile8name);
				String extension9 = objetofile8name.split("\\.")[1];
		        String objetrfile8name = sdf.format(now.getTime())+"9."+extension9;
		        File f9 = new File(path + "\\" + objetrfile8name);
		        objetofile8.transferTo(f9);
		        objet.setObjetrfile8(objetrfile8name);
			}
		}
        
		int result = objetService.updateMyObjet(objet);
        
        if (result > 0) {
        	mav.setViewName("redirect:moveMyObjetList.do?userid=" + userid + "&currentPage=1");
    	} else {
    		mav.addObject("message", "오브제 수정 실패");
    		mav.setViewName("common/errorPage");
    	}
        
        return mav;
	}
	
	// 내 오브제 전시삭제
	@RequestMapping("deleteObjet.do")
	public void deleteObjet(@RequestParam(value="lists") String checkBox,
		HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int result = 0;
		if(checkBox != null) {
		// 체크박스로 삭제
		String check[] = checkBox.split(",");
			for(int i = 0; i < check.length; i++) {
				Artist objet = objetService.selectObjetOne(Integer.parseInt(check[i]));
				if(objet != null) {
					File file1 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getRenamemainposter()));
					File file2 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile1()));
					File file3 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile2()));
					File file4 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile3()));
					File file5 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile4()));
					File file6 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile5()));
					File file7 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile6()));
					File file8 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile7()));
					File file9 = new File(request.getSession().getServletContext().getRealPath("resources/images/objet/" + objet.getObjetrfile8()));
					if (file1.exists() && file2.exists() && file3.exists() && file4.exists() && 
						file5.exists() && file6.exists() && file7.exists() && file8.exists() && file9.exists()) { 
						if (file1.delete() && file2.delete() && file3.delete() && file4.delete() && file5.delete() &&
							file6.delete() && file7.delete() && file8.delete() && file9.delete()) {
							logger.info("파일삭제 성공");
						} else {
							logger.info("파일삭제 실패");
						}
					} else {
						logger.info("파일이 존재하지 않습니다.");
					}
				}
				result = objetService.deleteObjet(Integer.parseInt(check[i]));
			}
		}
		
		String resultValue = "";
		if(result > 0) {
			resultValue = "ok";
		}else {
			resultValue = "fail";
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

			
	
			// 박근수 *******************************************************************************
			//오브제 관리 - 전시 등록 페이지 이동
			@RequestMapping("moveCreateObjet.do")
			public String moveCreateObjet() {
				return "objet/createObjet";
			}
				
			/*//오브제 관리 - 전시 등록
			@RequestMapping(value="insertObjet.do", method=RequestMethod.POST)
			public String insertObjet(Objet3 objet3, Model model, MultipartHttpServletRequest mtfRequest) throws IOException{
				List<MultipartFile> fileList = mtfRequest.getFiles("file");
				String src = mtfRequest.getParameter("src");
				System.out.println("src value : " + src);
				String path = "../resources/objet_upfiles";
				
				for (MultipartFile mf : fileList) {
					String originFileName = mf.getOriginalFilename();	//원본 파일명
					long fileSize = mf.getSize();	//파일 사이즈
					
					System.out.println("originFileName : " + originFileName);
					System.out.println("fileSize : " + fileSize);
					
					String safeFile = path + System.currentTimeMillis() + originFileName;
					try {
						mf.transferTo(new File(safeFile));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
				
				int result = objetService.insertObjet(objet3);
				
				String viewFileName = "createObjet";
				if(result < 0) {
					model.addAttribute("message", "Insert failed...");
					viewFileName = "common/error";
				}
				return viewFileName;
			}
				*/
		

}
