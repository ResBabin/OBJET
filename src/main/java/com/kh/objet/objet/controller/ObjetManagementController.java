package com.kh.objet.objet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetManagementService;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ObjetManagement;
import com.kh.objet.qna.model.service.QnaService;
import com.kh.objet.qna.model.vo.Qna;
import com.kh.objet.reportboard.model.service.ReportBoardService;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.service.UserManagementService;
import com.kh.objet.users.model.vo.LoginCount;
import com.kh.objet.users.model.vo.UserManagement;
import com.kh.objet.users.model.vo.Users;


@Controller
public class ObjetManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetManagementController.class);
	
	@Autowired
	private ObjetManagementService objetmService;
	@Autowired
	private ReportBoardService reportbService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private UserManagementService usermService;
	
	
	public ObjetManagementController() {}
	
	@RequestMapping("objetm.do")
	public String allObjetList(Model model, HttpServletRequest request) {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String objetstatus = request.getParameter("objetstatus");
		String publicyn = request.getParameter("publicyn");
		String objettag = request.getParameter("objettag");
		String objettitle = request.getParameter("objettitle");
		String userid = request.getParameter("userid");
		logger.debug(order);
		logger.debug(publicyn);
		logger.debug(objettag);
		if(order != null || order != null && !order.equals("")) {
			map.put("order", order);
		}else {
			map.put("order", "idd");
		}
			
		if(objetstatus != null && !objetstatus.equals("") || objetstatus == null) {
			map.put("objetstatus", objetstatus);
		}
		if(publicyn != null && !publicyn.equals("")) {
			map.put("publicyn", publicyn);
		}
		if(objettag != null && !objettag.equals("")) {
			map.put("objettag", objettag);
		}
	
		if(userid != null && userid != "") {
			map.put("userid", userid);
		}
		if(objettitle != null && objettitle != "") {
			map.put("objettitle", objettitle);
		}
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = objetmService.selectStatusOrderList(map);  //테이블의 전체 목록 갯수 조회
		//총 페이지 수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
        if(currentPage % limit == 0) {
            beginPage -= limit;
         }
		int endPage = beginPage + 9;
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		map.put("startRow", Integer.toString(startRow));
		map.put("endRow", Integer.toString(endRow));
		
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectStatusOrder(map);
		
			model.addAttribute("objetmlist", objetmlist);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
		return "admin/objetManagement";
	}
/*	@RequestMapping("objetm.do")
	public String allObjetList(Model model, HttpServletRequest request) {
		Map<String, Integer> map = new HashMap<>();
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = objetmService.selectObjetListCount();
		//총 페이지 수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		if(currentPage % limit == 0) {
			beginPage -= limit;
		}
		int endPage = beginPage + 9;
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectAllObet(map);
		model.addAttribute("objetmlist", objetmlist);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		return "admin/objetManagement";
	}
*/	@RequestMapping("objetmd.do")
	public String objetManageDetail (@RequestParam("objetno") int objetno, Model model) {
		ObjetManagement objet = objetmService.selectObjetOne(objetno);
		model.addAttribute("objet", objet);
		return "admin/objetManageDetail";
	}
	
	@RequestMapping("objetreq.do")
	public String objetRequestManage(Model model) {
		ArrayList<Objet> objetreqlist = (ArrayList<Objet>) objetmService.selectObjetRequestManage();
		model.addAttribute("objetreqlist", objetreqlist);
		return "admin/objetRequestManage";
	}
	
	@RequestMapping("warning.do")
	public String waringPage() {
		return "admin/warning";
	}
	
	
	@RequestMapping("adminmain.do")
	public String adminMain(Model model) {
		ArrayList<Objet> objetreqlist = (ArrayList<Objet>) objetmService.selectObjetRequestManage();
		ArrayList<ReportBoard> reportblist = (ArrayList<ReportBoard>) reportbService.selectReportMain();
		ArrayList<Qna>qnalist = (ArrayList<Qna>) qnaService.selectQnaListAdmin5();
		ArrayList<ReportUDetail> reportulist= (ArrayList<ReportUDetail>) usermService.selectReportUDetailMain();
		int objetmlist = objetmService.selectObjetListCount();
		ArrayList<String> userlist = (ArrayList<String>) usermService.selectUserEnrollDate();
		ArrayList<String> objettag = new ArrayList<String>();
		ArrayList<Users> enrollcount = (ArrayList<Users>) usermService.selectEnrollCount();
		int bkcount = usermService.selectBlacklistCount();
		int qnacount = qnaService.selectQnaCountAd();
		int qnaanswercount = qnaService.selectQnaCountAnswer();
		int beforestart = objetmService.selectBeforeStart();
		
		Date currenttime = new Date(System.currentTimeMillis());
		//현재 년/월/일
		SimpleDateFormat sdf = new SimpleDateFormat("yy");
		String thisyear = sdf.format(currenttime);
		//현재 년/월/일/시
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy/MM");
		String  enrollmonth = "";
		SimpleDateFormat sdf3 = new SimpleDateFormat("yy/MM/dd");
		
		String today = sdf3.format(currenttime);
		
		int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0, count6 = 0, count7 = 0, count8 = 0, count9 = 0, count10 = 0, count11 = 0, count12 = 0; 
		
		for (int i = 0; i < enrollcount.size(); i++) {
			enrollmonth = sdf2.format(enrollcount.get(i).getEnrolldate());
			if(enrollmonth.equals(thisyear+"/01")) {
				count1++;
			}else if(enrollmonth.equals(thisyear+"/02")) {
				count2++;
			}else if(enrollmonth.equals(thisyear+"/03")) {
				count3++;
			}else if(enrollmonth.equals(thisyear+"/04")) {
				count4++;
			}else if(enrollmonth.equals(thisyear+"/05")) {
				count5++;
			}else if(enrollmonth.equals(thisyear+"/06")) {
				count6++;
			}else if(enrollmonth.equals(thisyear+"/07")) {
				count7++;
			}else if(enrollmonth.equals(thisyear+"/08")) {
				count8++;
			}else if(enrollmonth.equals(thisyear+"/09")) {
				count9++;
			}else if(enrollmonth.equals(thisyear+"/10")) {
				count10++;
			}else if(enrollmonth.equals(thisyear+"/11")) {
				count11++;
			}else if(enrollmonth.equals(thisyear+"/12")){
				count12++;
			}
				
		}
		logger.debug((thisyear+"/02"));
		logger.debug(enrollmonth);
		
	//	int testcount = usermService.updateLoginCount(upcount);
		
	//	logger.debug("카운트" + testcount);
		
		//String today = "20/01/07";
		LoginCount todaycount = usermService.selectTodayCount(today);
		
	/*	
		for(int i = 0; i < objetmlist.size(); i++) {
			String[] tag = objetmlist.get(i).getObjettag().split(","); 
			for(int j = 0; j < tag.length; j++) {
				objettag.add(tag[j]);
			}
		}*/
		System.out.println(objettag);
		model.addAttribute("todaycount", todaycount);
		model.addAttribute("objettag", objettag);
		model.addAttribute("objetreqlist", objetreqlist);
		model.addAttribute("objetmlist", objetmlist);
		model.addAttribute("reportblist", reportblist);
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("enrollcount", enrollcount);
		model.addAttribute("reportulist", reportulist);
		model.addAttribute("userlist", userlist);
		model.addAttribute("qnacount", qnacount);
		model.addAttribute("qnaanswercount", qnaanswercount);
		model.addAttribute("beforestart", beforestart);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		model.addAttribute("count3", count3);
		model.addAttribute("count4", count4);
		model.addAttribute("count5", count5);
		model.addAttribute("count6", count6);
		model.addAttribute("count7", count7);
		model.addAttribute("count8", count8);
		model.addAttribute("count9", count9);
		model.addAttribute("count10", count10);
		model.addAttribute("count11", count11);
		model.addAttribute("count12", count12);
		model.addAttribute("bkcount", bkcount);
		return "admin/adminmain"; 
	}
	/*@RequestMapping(value="logincount", method=RequestMethod.POST)
	public void updateLoginCount(HttpServletResponse response) throws IOException {
		// 현재 년/월/일/시
		Date currenttime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
		String updatecount = sdf2.format(currenttime);
		String upcount = "login" + updatecount;
		logger.debug("현재 시간 : " + upcount);

		int testcount = usermService.updateLoginCount(upcount);

		logger.debug("카운트" + testcount);

		PrintWriter out = response.getWriter();

		if (testcount > 0) {
			out.append("success");
		} else {
			out.append("fail");
		}
		out.flush();
		
	}
	*/
	@RequestMapping(value="insertlogindate", method=RequestMethod.POST)
	public void insertLoginDate(HttpServletResponse response) throws IOException {
		//현재 년/월/일
		if( usermService.selectLoginDate() == null ) { 
			usermService.insertLoginCount();
		}
	}
	@RequestMapping(value="updateReqStatus", method=RequestMethod.POST)
	public String updateRequestStatus(HttpServletRequest request, Model model) {
		Map<String, String> map  = new HashMap<>();
		map.put("objetno", request.getParameter("objetno"));
		map.put("publicyn", request.getParameter("publicyn"));
		int result = objetmService.updateRequestStatus(map);
		String view = "";
		if(result > 0) {
			 view = "redirect:objetreq.do";
		}else {
			model.addAttribute("message", "전시 승인/반려 오류");		
			view = "common/error";
			}
		return view;
	}
	@RequestMapping(value="updateObjetStop", method=RequestMethod.POST)
	public String updateObjetStop(HttpServletRequest request, Model model) {
		int objetno = Integer.parseInt(request.getParameter("objetno"));
		int result = objetmService.updateObjetStop(objetno);
		String view = "";
		if(result > 0) {
			 view = "redirect:objetm.do";
		}else {
			model.addAttribute("message", "전시 승인/반려 오류");		
			view = "common/error";
			}
		return view;
	}
	@RequestMapping(value="objetStatusOrder.do", method=RequestMethod.POST)
	public void selectStatusOrder(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String objetstatus = request.getParameter("objetstatus");
		String publicyn = request.getParameter("publicyn");
		String objettag = request.getParameter("objettag");
		String objettitle = request.getParameter("objettitle");
		String userid = request.getParameter("userid");
			
		if(!objetstatus.equals("")) {
			map.put("objetstatus", objetstatus);
		}
		if(!publicyn.equals("")) {
			map.put("publicyn", publicyn);
		}
		if(!objettag.equals("")) {
			map.put("objettag", objettag);
		}
		map.put("order", order);
		if(userid != "") {
			map.put("userid", userid);
		}
		if(objettitle != "") {
			map.put("objettitle", objettitle);
		}
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = objetmService.selectStatusOrderList(map);  //테이블의 전체 목록 갯수 조회
		//총 페이지 수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
        if(currentPage % limit == 0) {
            beginPage -= limit;
         }
		int endPage = beginPage + 9;
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		map.put("startRow", Integer.toString(startRow));
		map.put("endRow", Integer.toString(endRow));
		
		
		ArrayList<Objet> statusOrderList = (ArrayList<Objet>) objetmService.selectStatusOrder(map);
		
		//전송용 json 객체
		JSONObject sendJson = new JSONObject();
		//json 배열 객체
		JSONArray jarr = new JSONArray();
		//list를 jarr 로 옮겨 저장 (복사)
			for (Objet objetso : statusOrderList) {
				JSONObject job = new JSONObject();
				job.put("userid", objetso.getUserid());
				job.put("objettitle", URLEncoder.encode(objetso.getObjettitle(), "utf-8"));
				job.put("objettag", URLEncoder.encode(objetso.getObjettag(), "utf-8"));
				job.put("startdate", objetso.getObjetstartdate().toString());
				job.put("enddate", objetso.getObjetenddate().toString());
				job.put("objetno", objetso.getObjetno());
				job.put("status", objetso.getObjetstatus());
				job.put("publicyn", objetso.getPublicyn());
		
				jarr.add(job);
			}
		/*	job.put("currentPage", currentPage);
			job.put("listCount", listCount);
			job.put("maxPage", maxPage);
			job.put("beginPage", beginPage);
			job.put("endPage", endPage);*/
		sendJson.put("list", jarr);
	//	logger.debug(jarr.toJSONString());
		response.setContentType("application/jsonl charset=utf-8");
		PrintWriter out = response.getWriter();
		sendJson.put("currentPage", currentPage);
		sendJson.put("beginPage", beginPage);
		sendJson.put("endPage", endPage);
		sendJson.put("maxPage", maxPage);
		sendJson.put("listCount", listCount);
		
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
/*	@RequestMapping(value="objetStatusOrder.do", method=RequestMethod.POST)
	public void selectStatusOrder(HttpServletResponse response, HttpServletRequest request) throws IOException {
		Map<String, String> map = new HashMap<>();
		String order = request.getParameter("order");
		String objetstatus = request.getParameter("objetstatus");
		String publicyn = request.getParameter("publicyn");
		String objettag = request.getParameter("objettag");
		String objettitle = request.getParameter("objettitle");
		String userid = request.getParameter("userid");
		
		if(!objetstatus.equals("")) {
			map.put("objetstatus", objetstatus);
		}
		if(!publicyn.equals("")) {
			map.put("publicyn", publicyn);
		}
		if(!objettag.equals("")) {
			map.put("objettag", objettag);
		}
		map.put("order", order);
		if(userid != "") {
			map.put("userid", userid);
		}
		if(objettitle != "") {
			map.put("objettitle", objettitle);
		}
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = objetmService.selectStatusOrderList(map);  //테이블의 전체 목록 갯수 조회
		//총 페이지 수 계산
		int maxPage = listCount / limit;
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
		if(currentPage % limit == 0) {
			beginPage -= limit;
		}
		int endPage = beginPage + 9;
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		map.put("startRow", Integer.toString(startRow));
		map.put("endRow", Integer.toString(endRow));
		
		
		ArrayList<Objet> statusOrderList = (ArrayList<Objet>) objetmService.selectStatusOrder(map);
		
		//전송용 json 객체
		JSONObject sendJson = new JSONObject();
		//json 배열 객체
		JSONArray jarr = new JSONArray();
		//list를 jarr 로 옮겨 저장 (복사)
		for (Objet objetso : statusOrderList) {
			JSONObject job = new JSONObject();
			job.put("userid", objetso.getUserid());
			job.put("objettitle", URLEncoder.encode(objetso.getObjettitle(), "utf-8"));
			job.put("objettag", URLEncoder.encode(objetso.getObjettag(), "utf-8"));
			job.put("startdate", objetso.getObjetstartdate().toString());
			job.put("enddate", objetso.getObjetenddate().toString());
			job.put("objetno", objetso.getObjetno());
			job.put("status", objetso.getObjetstatus());
			job.put("publicyn", objetso.getPublicyn());
			
			job.put("currentPage", currentPage);
			job.put("listCount", listCount);
			job.put("maxPage", maxPage);
			job.put("beginPage", beginPage);
			job.put("endPage", endPage);
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		//	logger.debug(jarr.toJSONString());
		response.setContentType("application/jsonl charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
*/	@RequestMapping("objetAllSearch.do")
	public String objetAllSearch(Model model, @RequestParam("userid") String userid, @RequestParam("objettitle") String objettitle, @RequestParam("page") int page) {
		Objet objetsearch = new Objet();
		Map<String, String> map = new HashMap<>();
		if(userid != "") {
			map.put("userid", userid);
		}
		if(objettitle != "") {
			map.put("objettitle", objettitle);
		}
		map.put("order", "nod");
		int currentPage = 1;
		if(page != 0) {
			currentPage = page;
		}
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = objetmService.selectStatusOrderList(map);  //테이블의 전체 목록 갯수 조회
		//총 페이지 수 계산
		int maxPage = listCount / limit; 
		if(listCount % limit > 0)
			maxPage++;
		
		//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
		//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
		int beginPage = (currentPage / limit) * limit + 1;
        if(currentPage % limit == 0) {
            beginPage -= limit;
         }
		int endPage = beginPage + 9;
		if(endPage > maxPage)
			endPage = maxPage;
		
		//currentPage 에 출력할 목록의 조회할 행 번호 계산
		int startRow = (currentPage * limit) - 9;
		int endRow = currentPage * limit;
		map.put("startRow", Integer.toString(startRow));
		map.put("endRow", Integer.toString(endRow));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);

		ArrayList<Objet> searchlist = (ArrayList<Objet>) objetmService.selectStatusOrder(map);
		model.addAttribute("objetmlist", searchlist);
		return "admin/objetManagement";
	}
	@RequestMapping("vrtest.do")
	public String vrtest(@RequestParam("objetno") int objetno, Model model) {
		ObjetManagement objet = objetmService.selectObjetOne(objetno);
		model.addAttribute("objet", objet);
		return "objetGallery";
	}
	@RequestMapping("coltest.do")
	public String vrcol(@RequestParam("objetno") int objetno, Model model) {
		ObjetManagement objet = objetmService.selectObjetOne(objetno);
		model.addAttribute("objet", objet);
		return "CollisionTest";
	}
}
