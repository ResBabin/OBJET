package com.kh.objet.support.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.support.model.service.SupportServiceImpl;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;


@Controller
public class SupportController {
	
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private SupportServiceImpl supportService;
	
	
	@Autowired
	private Paging paging;
	
	public SupportController() {}
	
	
	// 후원하기(or 후원관리) 버튼 클릭 시 이동 페이지 설정
	@RequestMapping("moveSupportManagement.do")
	public String moveSupportManagement(@RequestParam(value="artistid") String artistid, @RequestParam(value="sptid") String sptid, Model model) {
		String vfn = "support/supportMain";
		
		ApplySupport support = supportService.selectSupport(artistid);
		
		// 작가가 자신의 작가홈에서 후원관리를 눌렀을 때
		
			if(support != null) {
				// 후원 신청한 적이 있다면 -> 후원하기 페이지
				model.addAttribute("maintype", "1");
				model.addAttribute("support", support);
				model.addAttribute("artistid", artistid);
			}else if(support == null) {
				// 후원 신청한 적이 없다면-> 후원홍보 설정화면
				model.addAttribute("maintype", "2");
				model.addAttribute("artistid", artistid);
			}else {
				vfn = "common/error";
				model.addAttribute("message", "후원 페이지 이동 실패!");
			}
		
		return vfn;
	}
	
	
	// 후원하기 클릭 시
	@RequestMapping(value="goSupport.do", method=RequestMethod.POST)
	public String goSupport(MySupport mysupport, Model model) {
		model.addAttribute("support", mysupport);
		return "support/paymentPage";
	}
	
	// 후원하기
	@RequestMapping("insertSupport.do")
	public void insertSupport(MySupport mysupport, HttpServletResponse response) throws IOException {
		int result = supportService.insertSupport(mysupport);
		
		String returnValue = null;
		if(result > 0) {
			logger.debug("후원 테이블 추가 성공");
			returnValue = "ok";
		}else {
			logger.debug("후원 테이블 추가 실패");
			returnValue = "fail";
		}
		
		
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	}
	
	
	// 후원 등록 페이지
	@RequestMapping("moveApplySupport.do")
	public String moveApplySupport() {
		return "support/applySupport";
	}
	
	
	// 후원 정보 입력
	@RequestMapping(value="insertApplySupport.do", method=RequestMethod.POST)
	public String insertApply(ApplySupport applysupport, Model model) {
		String vfn = null;
		
		int result = supportService.insertApply(applysupport);
		
		if(result > 0) {
			vfn = "redirect:/moveSupportManagement.do?artistid="+applysupport.getArtistid()+"&sptid="+applysupport.getArtistid();
		}else {
			vfn = "common/error";
			model.addAttribute("message", "후원 정보 입력 실패!");
		}
		return vfn;
	}
	
	
	// 후원 내용 수정 페이지로 이동
	@RequestMapping("moveModifyApplySupport.do")
	public String moveModifyApplySupport(@RequestParam(value="artistid") String artistid, Model model) {
		String vfn = null;
		
		ApplySupport applysupport = supportService.moveModifySupport(artistid);
		if(applysupport!=null) {
			vfn = "support/applySupportModify";
			model.addAttribute("applysupport", applysupport);
		}else {
			vfn = "common/error";
			model.addAttribute("message", "후원 내용 수정 페이지 이동 실패!");
		}
		return vfn;
	}
	
	
	// 후원 내용 수정
	@RequestMapping(value="updateApplySupport.do", method=RequestMethod.POST)
	public String updateApplySupport(ApplySupport applysupport, Model model) {
		String vfn = null;
		
		int result = supportService.updateApplySupport(applysupport);
		
		if(result > 0) {
			vfn = "redirect:/moveSupportManagement.do?artistid="+applysupport.getArtistid()+"&sptid="+applysupport.getArtistid();
		}else {
			vfn = "common/error";
			model.addAttribute("message", "후원 내용 수정 실패!");
		}
		
		return vfn;
	}
	
	// 내 후원 정보 삭제
	@RequestMapping("deleteApplySupport.do")
	public void deleteApplySupport(@RequestParam(value="artistid") String artistid, HttpServletResponse response) throws IOException {
		int result = supportService.deleteApplySupport(artistid);
		
		String returnValue = null;
		
		if(result > 0) 
			returnValue = "ok";
		else
			returnValue = "fail";
		
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
		
	}
	
	
	// 보낸 후원 내역
	@RequestMapping("moveSendSupport.do")
	public String moveSendSupport(@RequestParam(value="sptid") String sptid, @RequestParam(value="currentPage") String currentPage, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		int listCount = supportService.selectSendSupportListCount(sptid);
		paging.makePage(listCount, curPage);
		
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("sptid", sptid); // 대상 아티스트 아이디
				
		List<MySupport> sendlist = supportService.selectSendSupport(map);
		
		model.addAttribute("sptid", sptid);
		model.addAttribute("sendlist", sendlist);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		
		return "support/sendSupportList";
	}
	
	// 보낸 후원 내역 검색용
	@RequestMapping(value="moveSendSupportSearch.do", method=RequestMethod.POST)
	public String moveSendSupportSearch(@RequestParam(value="sptid") String sptid,@RequestParam(value="currentPage") String currentPage, @RequestParam(value="searchtype") String searchtype, @RequestParam(value="keyword") String keyword, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sptid", sptid);
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);

			
		int listCount = supportService.selectSendSupportSearchListCount(map);
		paging.makePage(listCount, curPage);
				
		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		
		List<MySupport> sendlist = supportService.selectSendSupportSearch(map);
		
		model.addAttribute("sendlist", sendlist);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "search"); // 출력타입은 전체(all)과 검색(search)로 나뉘어져있음
		
		return "support/sendSupportList";
	}
	
	// 받은 후원 내역
	@RequestMapping("moveReceiveSupport.do")
	public String moveReceiveSupport(@RequestParam(value="artistid") String artistid, @RequestParam(value="currentPage") String currentPage, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		int listCount = supportService.selectReceiveSupportListCount(artistid);
		paging.makePage(listCount, curPage);
		
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("artistid", artistid); // 대상 아티스트 아이디
				
		List<MySupport> receivelist = supportService.selectReceiveSupport(map);
		
		model.addAttribute("artistid", artistid);
		model.addAttribute("receivelist", receivelist);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
				
		return "support/receiveSupportList";
	}
	
	
	
	// 받은 후원 내역 검색용
		@RequestMapping(value="moveReceiveSupportSearch.do", method=RequestMethod.POST)
		public String moveReceiveSupportSearch(@RequestParam(value="artistid") String artistid, @RequestParam(value="currentPage") String currentPage,@RequestParam(value="searchtype") String searchtype, @RequestParam(value="keyword") String keyword, Model model) {
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("artistid", artistid);
			map.put("searchtype", searchtype);
			map.put("keyword", keyword);

				
			int listCount = supportService.selectReceiveSupportSearchListCount(map);
			paging.makePage(listCount, curPage);
					
			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			
			List<MySupport> receivelist = supportService.selectReceiveSupportSearch(map);
			
			model.addAttribute("receivelist", receivelist);
			model.addAttribute("paging", paging);
			model.addAttribute("kind", "search"); // 출력타입은 전체(all)과 검색(search)로 나뉘어져있음
			
			return "support/receiveSupportList";
		}
	
	// 정산 현황
	@RequestMapping("moveRequestSupport.do")
	public String moveRequestSupport(@RequestParam(value="artistid") String artistid, @RequestParam(value="currentPage") String currentPage, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		int listCount = supportService.selectRequestSupportListCount(artistid);
		paging.makePage(listCount, curPage);
		
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("artistid", artistid); // 대상 아티스트 아이디
				
		List<MySupport> requestlist = supportService.selectRequestSupport(map);
		
		model.addAttribute("artistid", artistid);
		model.addAttribute("requestlist", requestlist);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		
		return "support/requestSupportList";
	}
	
	// 정산 현황 상세보기
	@RequestMapping(value="moveRequestSupportDetail.do")
	public String moveRequestSupportDetail(@RequestParam(value="requestno") int requestno, @RequestParam(value="artistid") String artistid, Model model) {
		String vfn = "support/requestSupportDetail";
		
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("requestno", requestno);
		map.put("artistid", artistid); // 대상 아티스트 아이디
		
		RequestSupport requestsupport = supportService.moveRequestSupportDetail(map);
		
		if(requestsupport != null) 
			model.addAttribute("requestsupport", requestsupport);
		else {
			model.addAttribute("message", "정산현황 상세보기 실패!");
			vfn = "common/error";
		}
		return vfn;
	}
	


}



