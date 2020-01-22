package com.kh.objet.likeobjet.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.kh.objet.likeobjet.model.service.LikeObjetServiceImpl;
import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.likeobjet.model.vo.LikeObjet2;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class LikeObjetController {

	private static final Logger logger = LoggerFactory.getLogger(LikeObjetController.class);
	
	@Autowired
	private ObjetServiceImpl objetService;
	
	@Autowired
	public LikeObjetServiceImpl likeObjetService;
	
	@Autowired
	private Paging paging;
	
	public LikeObjetController() {}
	
	// 최민영 *****************************************
		// 오브제 관리 - 관심오브제 페이지 이동
			@RequestMapping("moveMyLikeObjetList.do")
			public String moveMyLikeObjetList(@RequestParam(value="userid") String userid, @RequestParam(value="currentPage") String currentPage, Model model) {
				//페이징처리 
				int curPage = Integer.valueOf(currentPage);
				int listCount = likeObjetService.myLikeObjetGetListCount(userid);
				paging.makePage(listCount, curPage);
				
						
				// HashMap 객체 생성
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("startRow", paging.getStartRow());
				map.put("endRow", paging.getEndRow());
				map.put("userid", userid); // 대상 아티스트 아이디
				
				List<LikeObjet2> list = likeObjetService.moveMyLikeObjetList(map);
				
				
				model.addAttribute("likelist", list);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
				return "objet/myLikeObjetList";
			}
		

		// 오브제 관리 - 관심오브제 삭제
			@RequestMapping("deleteMyLikeObjetList.do")
			public void deleteMyLikeObjetList(@RequestParam(value="objetno", required=false) int objetno, HttpServletResponse response) throws IOException {
				System.out.println("objetno : " + objetno);
				int result = likeObjetService.deleteMyLikeObjetList(objetno);
				
				String returnValue = null;
				if(result > 0) {
					returnValue = "ok";
				}else {
					returnValue = "Failed.. Retry";
				}
				
				PrintWriter out = response.getWriter();
				out.append(returnValue);
				out.flush();
				out.close();
				
			}
			
		// 오브제 관리 - 관심오브제 검색
			@RequestMapping(value="selectMyLikeObjetSearch.do", method= {RequestMethod.POST, RequestMethod.GET})
			public String selectMyLikeObjetSearch(@RequestParam(value="objettitle") String objettitle, @RequestParam(value="nickname") String nickname,
					@RequestParam(value="objetstatus") String objetstatus, @RequestParam(value="userid") String userid, 
					@RequestParam(value="currentPage") String currentPage, Model model) throws IOException  {
				System.out.println("objettitle : " + objettitle);
				System.out.println("nickname : " + nickname);
				System.out.println("objetstatus : " + objetstatus);
				System.out.println("userid : " + userid);
				System.out.println("currentPage : " + currentPage);
				//페이징처리 
				int curPage = Integer.valueOf(currentPage);
				// HashMap 객체 생성
				HashMap<String, Object> map1 = new HashMap<String, Object>();
					map1.put("objettitle", objettitle);
					map1.put("nickname", nickname);
					map1.put("objetstatus", objetstatus);
					map1.put("userid", userid);
						
				int listCount = likeObjetService.selectMyLikeObjetSearchListCount(map1);
				paging.makePage(listCount, curPage);

						
				// HashMap 객체 생성
				HashMap<String, Object> map2 = new HashMap<String, Object>();

				map2.put("startRow", paging.getStartRow());
				map2.put("endRow", paging.getEndRow());
				map2.put("objettitle", objettitle);
				map2.put("nickname", nickname);
				map2.put("objetstatus", objetstatus);
				map2.put("userid", userid);
				
				List<LikeObjet2> list = likeObjetService.selectMyLikeObjetSearch(map2);
				
				model.addAttribute("objettitle", objettitle);
				model.addAttribute("likelist", list);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "search"); // 출력타입은 전체(all) 과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
				model.addAttribute("nickname", nickname);
				model.addAttribute("objetstatus", objetstatus);
				
				return "objet/myLikeObjetList";
			}
	
	
		//박예은
		//관심오브제 캘린더
		@RequestMapping(value="likeObjetPlan.do", method=RequestMethod.POST)
		@ResponseBody
		public void selectLikeObjetCalendar(@RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException {
			List<LikeObjet> likeObjetPlanList = objetService.selectLikeObjetCalendar(userid);
			JSONObject sendJson = new JSONObject();
			JSONArray jarr = new JSONArray();
			for(LikeObjet likeobjet : likeObjetPlanList) {
			JSONObject job = new JSONObject();
			job.put("title", URLEncoder.encode(likeobjet.getObjettitle(), "utf-8"));
			job.put("start", likeobjet.getObjetstartdate().toString());
			job.put("end", likeobjet.getObjetenddate().toString());
			job.put("color", likeobjet.getObjetcolor());
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

}
