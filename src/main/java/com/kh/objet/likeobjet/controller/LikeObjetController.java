package com.kh.objet.likeobjet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.likeobjet.model.service.LikeObjetServiceImpl;
import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class LikeObjetController {

	private static final Logger logger = LoggerFactory.getLogger(LikeObjetController.class);
	
	@Autowired
	public LikeObjetServiceImpl likeObjetService;
	
	public LikeObjetController() {}
	
	// 최민영 *****************************************
	// 오브제 관리 - 관심오브제 페이지 이동
		@RequestMapping("moveMyLikeObjetList.do")
		public String moveMyLikeObjetList(@RequestParam(value="userid", required=false) String userid, Paging paging) {
			return "objet/myLikeObjetList";
		}
	

	// 오브제 관리 - 관심오브제 삭제
		@RequestMapping("deleteMyLikeObjetList.do")
		public String deleteMyLikeObjetList(@RequestParam(value="objetno", required=false) int objetno, HttpServletResponse response) throws IOException {
			int result = likeObjetService.deleteMyLikeObjetList(objetno);
			
			String returnValue = null;
			if(result > 0) {
				returnValue = "OK";
			}else {
				returnValue = "Failed.. Retry";
			}
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
			
			return "objet/myLikeObjetList";
		}
		
	// 오브제 관리 - 관심오브제 검색
		@RequestMapping("selectMyLikeObjetSearch.do")
		public String selectMyLikeObjetSearch(@RequestParam(name="page", required=false) String page, @RequestParam(value="objettitle") String objettitle, 
				@RequestParam(value="userid") String userid, @RequestParam(value="objetstatus") String objetstatus, Model model)  {
			logger.info("page : " + page);
		    int currentPage = 1;
		    if(page !=null) {
		       currentPage = Integer.parseInt(page);
		     }
		    //페이징
	            int limit = 10;
	            int listCount = likeObjetService.listCount(); // 총 목록 갯수
	            
	            logger.info("listCount : " + listCount + ", currentPage : " + currentPage);
	       
	            //페이지 수 계산
	            int maxPage = (int)((double)listCount / limit + 0.9);
	            // 현재 페이지가 포함된 페이지 그룹의 시작값
	            int startPage = (int)((double)currentPage / limit + 0.9);
	            // 현재 페이지가 포함된 페이지 그룹의 끝값
	            int endPage = startPage + limit - 1;
	            
	            if(maxPage < endPage) {
	               endPage = maxPage;
	            }
	            
	            // 쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
	            int startRow = (currentPage - 1) * limit + 1;
	            int endRow = startRow + limit - 1;
	            
	            System.out.println(startRow + ", " + endRow);
	            
	            HashMap<String, Object> map = new HashMap<String, Object>();
	            map.put("startRow", startRow);
	            map.put("endRow", endRow);
	            
	            List<LikeObjet> list = likeObjetService.selectMyLikeObjetSearch(map);
	                              
	            System.out.println("공지 갯수 : " + list.size());
	            
	            
	            if(list != null && list.size() > 0) {
	               model.addAttribute("list",list);    //전체리스트
	               model.addAttribute("listCount",listCount);  //리스트 전체 갯수
	               model.addAttribute("maxPage",maxPage);
	               model.addAttribute("currentPage",currentPage);
	               model.addAttribute("startPage",startPage);
	               model.addAttribute("endPage",endPage);
	               model.addAttribute("limit",limit);
	               model.addAttribute("page", page);
	               
	               model.addAttribute("user/myQnaList");
	            } else {
	               model.addAttribute("message", currentPage + "페이지 목록 조회 실패");
	               model.addAttribute("common/error");
	            }
			
			return "objet/myLikeObjetList";
		}
	

}
