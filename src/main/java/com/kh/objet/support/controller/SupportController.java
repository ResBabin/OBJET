package com.kh.objet.support.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.feed.model.service.FeedServiceImpl;
import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.support.model.service.SupportServiceImpl;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;
import com.kh.objet.users.model.vo.Users;
import com.kh.objet.usersprofile.model.service.UsersProfileService;


@Controller
public class SupportController {
	
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private SupportServiceImpl supportService;
	
	@Autowired
	private FeedServiceImpl feedService;
	
	
	@Autowired
	private Paging paging;
	
	public SupportController() {}
	
	
	// 후원하기(or 후원관리) 버튼 클릭 시 이동 페이지 설정
	@RequestMapping("moveSupportManagement.do")
	public String moveSupportManagement(@RequestParam(value="artistid") String artistid, @RequestParam(value="sptid") String sptid, Model model) {
		String vfn = "support/supportMain";
		
		ApplySupport support = supportService.selectSupport(artistid);
		int countartist = supportService.selectCountArtist();
		int countsupport = supportService.selectCountSupport();
		int countsupporter = supportService.selectCountSupporter(artistid);
		
		// 작가가 자신의 작가홈에서 후원관리를 눌렀을 때
		
			if(support != null) {
				// 후원 신청한 적이 있다면 -> 후원하기 페이지
				model.addAttribute("maintype", "1");
				model.addAttribute("support", support);
				model.addAttribute("countsupporter", countsupporter);
				model.addAttribute("artistid", artistid);
			}else if(support == null) {
				// 후원 신청한 적이 없다면-> 후원홍보 설정화면
				model.addAttribute("maintype", "2");
				model.addAttribute("artistid", artistid);
			}else {
				vfn = "common/error";
				model.addAttribute("message", "후원 페이지 이동 실패!");
			}

			model.addAttribute("countartist", countartist);
			model.addAttribute("countsupport", countsupport);
			
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
		int result1 = supportService.insertSupport(mysupport);
		// 피드추가용 닉네임가져오기
		String sptnickname = supportService.selectartistnickname(mysupport.getSptid());
		// 후원 시 피드 알림 추가
		Feed feed = new Feed();
		feed.setArtistid(mysupport.getArtistid());
		feed.setUserid(mysupport.getSptid());
		feed.setFeedcontent(sptnickname + "님이 회원님께 " + mysupport.getSptamount() + "원을 후원하셨습니다.");
		int result2 = feedService.insertFeed(feed);
		
		String returnValue = null;
		if(result1 > 0 && result2 > 0) {
			logger.debug("후원 테이블&피드알림 테이블 추가 성공");
			returnValue = "ok";
		}else {
			logger.debug("후원 테이블&피드알림 테이블 추가 실패");
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
	public String insertApply(ApplySupport applysupport, @RequestParam(name="artistupfile", required=true) MultipartFile file, HttpServletRequest request, Model model) {
		String vfn = null;
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/support_upfiles");
		
		try {
			if(file != null && file.getOriginalFilename() != "") {
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
				file.transferTo(new File(savePath + "\\" + renameFileName));
				applysupport.setArtistofile(file.getOriginalFilename());
				applysupport.setArtistrfile(renameFileName);
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
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
	public String updateApplySupport(ApplySupport applysupport,  @RequestParam(name="artistupfile", required=true) MultipartFile file, HttpServletRequest request, Model model) {
		String vfn = null;
		
			String savePath = request.getSession().getServletContext().getRealPath("resources/support_upfiles");
		
		try {
			if(file != null && file.getOriginalFilename() != "") {
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
				file.transferTo(new File(savePath + "\\" + renameFileName));
				applysupport.setArtistofile(file.getOriginalFilename());
				applysupport.setArtistrfile(renameFileName);
			}else {
				if(applysupport.getArtistofile() != null && applysupport.getArtistrfile() != null) {
					applysupport.setArtistofile(applysupport.getArtistofile());
					applysupport.setArtistrfile(applysupport.getArtistrfile());
				}
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
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
		model.addAttribute("searchtype", searchtype);
		model.addAttribute("keyword", keyword);
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
			model.addAttribute("searchtype", searchtype);
			model.addAttribute("keyword", keyword);
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
				
		List<RequestSupport> requestlist = supportService.selectRequestSupport(map);
		
		model.addAttribute("artistid", artistid);
		model.addAttribute("requestlist", requestlist);
		model.addAttribute("paging", paging);
		model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)으로 나뉘어져있음
		
		return "support/requestSupportList";
	}
	
	
// 정산 현황 검색
	@RequestMapping(value="moveRequestSupportSearch.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String moveRequestSupportSearch(@RequestParam(value="artistid") String artistid, @RequestParam(value="requestyear") String requestyear, @RequestParam(value="requestmonth") String requestmonth, 
											@RequestParam(value="sptstatus") String sptstatus, @RequestParam(value="currentPage") String currentPage, Model model) {
		
		// int 변환
			int curPage = Integer.valueOf(currentPage);
			int year = Integer.valueOf(requestyear);
			int month = Integer.valueOf(requestmonth);
			
		// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("requestyear", year);
			map.put("requestmonth", month);
			map.put("sptstatus", sptstatus);
			map.put("artistid", artistid); // 대상 아티스트 아이디
			
		// 페이징처리 
			int listCount = supportService.selectRequestSupportSearchListCount(map);
			paging.makePage(listCount, curPage);
			
			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			
					
			List<RequestSupport> requestlist = supportService.selectRequestSupportSearch(map);
			
			model.addAttribute("artistid", artistid);
			model.addAttribute("requestlist", requestlist);
			model.addAttribute("paging", paging);
			model.addAttribute("requestyear", requestyear);
			model.addAttribute("requestmonth", requestmonth);
			model.addAttribute("sptstatus", sptstatus);
			model.addAttribute("kind", "search"); // 출력타입은 전체(all)과 검색(search)으로 나뉘어져있음
			
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
	
	// 정산 신청 가능 여부
	@RequestMapping(value="moveInsertRequestSupportyn.do")
	public void moveInsertRequestSupportyn(@RequestParam(value="") String artistid, HttpServletResponse response) throws IOException {
		String returnValue = null;
		
		int result = supportService.selectInsertRequestSupportyn(artistid);
		
		if(result > 0) 
			returnValue = "ok";
		else
			returnValue = "fail";
		
		
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
	}
	
	// 정산 신청 폼 이동
		@RequestMapping(value="moveInsertRequestSupport.do")
		public String moveInsertRequestSupport( @RequestParam(value="artistid") String artistid, Model model) {
			String vfn = "support/requestSupportInsert";
			
			// 기본정보 가져오기용
			ApplySupport applysupport = supportService.moveModifySupport(artistid);
			
			if(applysupport != null) 
				model.addAttribute("applysupport", applysupport);
			else {
				model.addAttribute("message", "정산신청 폼 이동 실패!");
				vfn = "common/error";
			}
			return vfn;
		}
		
		
	// 정산 신청
		@RequestMapping(value="insertRequestSupport.do", method=RequestMethod.POST)
		public void insertRequestSupport(RequestSupport requestsupport, HttpServletResponse response) throws IOException {
			String returnValue = null;
			
			int result = supportService.selectInsertRequestSupport(requestsupport);
			
			if(result > 0) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}
		
	// 정산 취소
		@RequestMapping(value="deleteRequestSupport.do")
		public void deleteRequestSupport(@RequestParam(value="requestno") int requestno, HttpServletResponse response) throws IOException {
			String returnValue = null;
			
			int result = supportService.deleteRequestSupport(requestno);
			
			if(result > 0) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}

		// 파일 다운로드
		@RequestMapping("requestFileDown.do")
		public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam(name="filename") String filename) {
			
			// 경로지정
			String savePath = request.getSession().getServletContext().getRealPath("resources/support_files");
			
			// 객체 생성
			File downFile = new File(savePath + "\\" + filename);
			
			/* ModelAndView(java.lang.String view, java.lang.String modelName, java.lang.Objet modelObject)
			 * ModelAndView(뷰 이름, 모델이름, 모델객체)
			 * model == request객체 와 같은 의미를 가진 스프링 객체
			 * modelName == 이름
			 * modelObject == 객체
			 * request.setAttribute("이름", 객체)와 같은 의미
			 * 이렇게 리턴하면 viewResolver가 받게 됨.
			 * */
			return new ModelAndView("filedown", "downFile", downFile);
		}
		
		
		// 감사메시지 페이지로 이동
		@RequestMapping(value="moveThnanksmsg.do")
		public String moveThnanksmsg(@RequestParam(value="artistid") String artistid, Model model) {
			String thanksmsg = supportService.selectThanksmsg(artistid);
			// 작가 닉네임 가져오기
			String artistnickname = supportService.selectartistnickname(artistid);
			
			
			String vfn = "support/thanksmsg";
			
			if(thanksmsg != null && artistnickname!=null) {
				model.addAttribute("thanksmsg", thanksmsg);
				model.addAttribute("artistnickname", artistnickname);
				model.addAttribute("artistid", artistid);
			}else {
				model.addAttribute("message", "후원 감사 메시지 이동 실패!");
				vfn = "common/error";
			}
			return vfn;
		}
		
		
		// 관리자영역 =============================================================================================================
		
		// 등록현황
		@RequestMapping("supportEnrollListm.do")
		public String supportEnrollListm(@RequestParam(value="currentPage") String currentPage, Model model) {
			String vfn = "admin/supportEnrollManagement";
			
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			int listCount = supportService.supportEnrollListCountm();
			paging.makePage(listCount, curPage);
			
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			
			List<ApplySupport> list = supportService.supportEnrollListm(map);
			
			if(list.size() >= 0) {
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "all");
			}else {
				model.addAttribute("message", "후원 등록현황 로딩 실패!");
				vfn = "common/error";
			}
			
			return vfn;
		}
		
		// 등록현황 검색
			@RequestMapping("supportEnrollSearchListm.do")
			public String supportEnrollListm(@RequestParam(value="currentPage") String currentPage, @RequestParam(value="artistid") String artistid,Model model) {
				String vfn = "admin/supportEnrollManagement";
				
				//페이징처리 
				int curPage = Integer.valueOf(currentPage);
				int listCount = supportService.supportEnrollSearchListCountm(artistid);
				paging.makePage(listCount, curPage);
				
				// HashMap 객체 생성
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("startRow", paging.getStartRow());
				map.put("endRow", paging.getEndRow());
				map.put("artistid", artistid);
				
				List<ApplySupport> list = supportService.supportEnrollSearchListm(map);
				
				if(list.size() >= 0) {
					model.addAttribute("listCount", listCount);
					model.addAttribute("list", list);
					model.addAttribute("artistid", artistid);
					model.addAttribute("paging", paging);
					model.addAttribute("kind", "search");
				}else {
					model.addAttribute("message", "후원 등록현황 검색 결과 로딩 실패!");
					vfn = "common/error";
				}
				
				return vfn;
			}
		
		
		// 등록현황 상세보기
		@RequestMapping("supportenrollListdetailm.do")
		public String supportenrollListdetailm(@RequestParam(value="artistid") String artistid, Model model) {
			String vfn = "admin/supportEnrollManageDetail";
			
			ApplySupport detail = supportService.supportenrollListdetailm(artistid);
			
			if(detail != null) {
				model.addAttribute("detail", detail);
			}else {
				model.addAttribute("message", "후원 등록 상세보기 로딩 실패!");
				vfn = "common/error";
			}
			
			return vfn;
		}
		
		
		// 후원현황
		@RequestMapping("supportListm.do")
		public String supportListm(@RequestParam(value="currentPage") String currentPage, Model model) {
			String vfn = "admin/supportListManagement";
			
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			int listCount = supportService.supportListCountm();
			paging.makePage(listCount, curPage);
			
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			
			List<MySupport> list = supportService.supportListm(map);
			
			if(list.size() >= 0) {
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "all");
			}else {
				model.addAttribute("message", "후원 전체현황 로딩 실패!");
				vfn = "common/error";
			}
			
			return vfn;
		}
		
		
		// 후원현황 검색
			@RequestMapping("supportSearchListm.do")
			public String supportSearchListm(@RequestParam(value="currentPage") String currentPage, @RequestParam(value="searchtype") String searchtype, @RequestParam(value="keyword") String keyword, Model model) {
				String vfn = "admin/supportListManagement";
				
				//페이징처리 
				int curPage = Integer.valueOf(currentPage);
				
				// HashMap 객체 생성
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("searchtype", searchtype);
				map.put("keyword", keyword);
				int listCount = supportService.supportSearchListCountm(map);
				paging.makePage(listCount, curPage);
				

				map.put("startRow", paging.getStartRow());
				map.put("endRow", paging.getEndRow());
				
				List<MySupport> list = supportService.supportSearchListm(map);
				
				if(list.size() >= 0) {
					model.addAttribute("listCount", listCount);
					model.addAttribute("list", list);
					model.addAttribute("searchtype", searchtype);
					model.addAttribute("keyword", keyword);
					model.addAttribute("paging", paging);
					model.addAttribute("kind", "search");
				}else {
					model.addAttribute("message", "후원 전체현황 검색결과 로딩 실패!");
					vfn = "common/error";
				}
				
				return vfn;
			}
		
		
		// 정산현황
		@RequestMapping("supportRequest.do")
		public String supportRequest(@RequestParam(value="currentPage") String currentPage, Model model) {
			String vfn = "admin/supportRequestListManagement";
			
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			int listCount = supportService.supportRequestListCountm();
			paging.makePage(listCount, curPage);
			
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());
			
			List<RequestSupport> list = supportService.supportRequestm(map);
			
			if(list.size() >= 0) {
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "all");
			}else {
				model.addAttribute("message", "후원 전체현황 로딩 실패!");
				vfn = "common/error";
			}
			
			return vfn;
		}
		
		// 정산현황 검색
		@RequestMapping("supportRequestSearchm.do")
		public String supportRequestSearchm(@RequestParam(value="currentPage") String currentPage, @RequestParam(value="artistid") String artistid, 
				@RequestParam(value="requestyear") String requestyear, @RequestParam(value="requestmonth") String requestmonth, @RequestParam(value="sptstatus") String sptstatus,Model model) {
			String vfn = "admin/supportRequestListManagement";
			
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			
			// HashMap 객체 생성
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("artistid", artistid);
			map.put("requestyear", requestyear);
			map.put("requestmonth", requestmonth);
			map.put("sptstatus", sptstatus);
			
			int listCount = supportService.supportRequestSearchmListCountm(map);
			paging.makePage(listCount, curPage);
			
			

			map.put("startRow", paging.getStartRow());
			map.put("endRow", paging.getEndRow());

			
			List<RequestSupport> list = supportService.supportRequestSearchm(map);
			
			if(list.size() >= 0) {
				model.addAttribute("listCount", listCount);
				model.addAttribute("list", list);
				model.addAttribute("artistid", artistid);
				model.addAttribute("requestyear", requestyear);
				model.addAttribute("requestmonth", requestmonth);
				model.addAttribute("sptstatus", sptstatus);
				model.addAttribute("paging", paging);
				model.addAttribute("kind", "search");
			}else {
				model.addAttribute("message", "후원 전체현황 로딩 실패!");
				vfn = "common/error";
			}
			
			return vfn;
		}
				
		
		
		// 정산현황 상세보기
		@RequestMapping("requestSupportDetailm.do")
		public String requestSupportDetailm(@RequestParam(value="requestno") int requestno, Model model) {
			String vfn = "admin/requestSupportDetail";
			
			RequestSupport request = supportService.requestSupportDetailm(requestno);
			
			Users users = supportService.selectUser(request.getArtistid());
			
			ApplySupport applysupport = supportService.selectSupport(request.getArtistid());
			
			if(request != null && users != null && applysupport != null) {
				model.addAttribute("request", request);
				model.addAttribute("users", users);
				model.addAttribute("applysupport", applysupport);
			}else {
				model.addAttribute("message", "정산 신청 상세보기 실패!");
				vfn = "commmon/error";
			}
			
			return vfn;
		}
		
		
		// 정산처리하기
		@RequestMapping("updateRequestSupportDetailm.do")
		public String updateRequestSupportDetailm(RequestSupport requestSupport, @RequestParam(name="sptupfiles", required=false) MultipartFile file, HttpServletRequest request, Model model) {
			
			String vfn = "redirect:/requestSupportDetailm.do?requestno="+requestSupport.getRequestno();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/support_upfiles");
			
			try {
				if(file != null && file.getOriginalFilename() != "") {
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = requestSupport.getArtistid() + "_m_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					file.transferTo(new File(savePath + "\\" + renameFileName));
					requestSupport.setSptofile(file.getOriginalFilename());
					requestSupport.setSptrfile(renameFileName);
				}
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			int result1 = supportService.updateRequestSupportDetailm(requestSupport);
			
			// update 성공하면 피드알림에도 추가
			Feed feed = new Feed();
			feed.setArtistid(requestSupport.getArtistid());
			feed.setUserid(requestSupport.getAdminid());
			String state = null;
			if(requestSupport.getSptstatus().equals("RJCT"))
				state = "반려";
			else if(requestSupport.getSptstatus().equals("DONE"))
				state = "처리완료 ";
			feed.setFeedcontent("신청하신 " + requestSupport.getRequestyear() + "/" + requestSupport.getRequestmonth() + "월분에 대한 정산이 " + state + " 되었습니다.");
			int result2 = feedService.insertFeed(feed);
			
			if(result1 <= 0 && result2 <=0) {
				vfn = "common/error";
				model.addAttribute("message", "정산 신청 처리 실패!");
			}
			
			
			return vfn;
		}


}



