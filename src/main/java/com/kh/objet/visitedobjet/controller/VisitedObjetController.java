package com.kh.objet.visitedobjet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.visitedobjet.model.service.VisitedObjetServiceImpl;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet2;

@Controller
public class VisitedObjetController {
	
	private static final Logger logger = LoggerFactory.getLogger(VisitedObjetController.class);
	
	@Autowired
	private VisitedObjetServiceImpl visitedObjetService;
	
	@Autowired
	private ObjetServiceImpl objetService;
	
	@Autowired
	private Paging paging;
	
	public VisitedObjetController() {}
	
	
	// 최민영 **************************************
	// 오브제 관리 - 다녀온 오브제 페이지 이동
		@RequestMapping("moveMyVisitedObjetList.do")
		public String moveMyVisitedObjetList(@RequestParam(value="userid") String userid, @RequestParam(value="currentPage") String currentPage, Model model) {
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			int listCount = visitedObjetService.myVisitedObjetGetListCount(userid);
			paging.makePage(listCount, curPage);
			
					
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			map.put("userid", userid); // 대상 아티스트 아이디
			
			List<VisitedObjet2> list = visitedObjetService.myVisitedObjetList(map);
			
			
			model.addAttribute("visitedlist", list);
			model.addAttribute("paging", paging);
			model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		  return "objet/myVisitedObjetList";
		}
	
		
	//오브제 관리 - 다녀온 오브제 검색
	@RequestMapping(value="selectMyVisitedObjetSearch.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String selectMyVisitedObjetSearch(@RequestParam(value="objettitle") String objettitle, @RequestParam(value="nickname") String nickname,
			@RequestParam(value="objetstatus") String objetstatus, @RequestParam(value="userid") String userid, 
			@RequestParam(value="currentPage") String currentPage, Model model) throws IOException {
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
				
		int listCount = visitedObjetService.selectMyVisitedObjetSearchListCount(map1);
		paging.makePage(listCount, curPage);

				
		// HashMap 객체 생성
		HashMap<String, Object> map2 = new HashMap<String, Object>();

		map2.put("startRow", paging.getStartRow());
		map2.put("endRow", paging.getEndRow());
		map2.put("objettitle", objettitle);
		map2.put("nickname", nickname);
		map2.put("objetstatus", objetstatus);
		map2.put("userid", userid);
		
		List<VisitedObjet2> list = visitedObjetService.selectMyVisitedObjetSearch(map2);
		
		model.addAttribute("objettitle", objettitle);
		model.addAttribute("visitedlist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "search"); // 출력타입은 전체(all) 과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		model.addAttribute("nickname", nickname);
		model.addAttribute("objetstatus", objetstatus);
    		
        return "objet/myVisitedObjetList";
		
	}
	
	// 오브제 관리 - 관심오브제 삭제
	@RequestMapping("deleteMyVisitedObjetList.do")
	public void deleteMyVisitedObjetList(@RequestParam(value="lists") String checkBox,
		      HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = 0;
	      if(checkBox != null) {
	      // 체크박스로 삭제
	      String check[] = checkBox.split(",");
	      for(int i = 0; i < check.length; i++) {
	         result = visitedObjetService.deleteMyVisitedObjetList(Integer.parseInt(check[i]));
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
	
	//박예은
	//다녀온 오브제 캘린더
	@RequestMapping(value="visitedObjetPlan.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectLikeObjetCalendar(@RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException {
		List<VisitedObjet> visitedObjetPlanList = objetService.selectVisitedObjetCalendar(userid);
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(VisitedObjet visitedobjet : visitedObjetPlanList) {
		JSONObject job = new JSONObject();
		job.put("title", URLEncoder.encode(visitedobjet.getObjettitle(), "utf-8"));
		job.put("start", visitedobjet.getVisitdate().toString());
		job.put("color", visitedobjet.getObjetcolor());
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
