package com.kh.objet.objet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView allObjetList(ModelAndView mv) {
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectAllObet();
		if (objetmlist != null) {
			mv.addObject("objetmlist", objetmlist);
			mv.setViewName("admin/objetManagement");
		} else {
			mv.addObject("message", "전시 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	@RequestMapping("objetmd.do")
	public ModelAndView objetManageDetail (ModelAndView mv, @RequestParam("objetno") int objetno) {
		Objet objet = objetmService.selectObjetOne(objetno);
		if (objet != null) {
			mv.addObject("objet", objet);
			mv.setViewName("admin/objetManageDetail");
		} else {
			mv.addObject("message", "전시 상세 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("objetreq.do")
	public String objetRequestManage(Model model) {
		ArrayList<Objet> objetreqlist = (ArrayList<Objet>) objetmService.selectObjetRequestManage();
		model.addAttribute("objetreqlist", objetreqlist);
		return "admin/objetRequestManage";
	}
	
	@RequestMapping("adminmain.do")
	public String adminMain(Model model) {
		Map<String, Integer> map = new HashMap<>();
		ArrayList<Objet> objetreqlist = (ArrayList<Objet>) objetmService.selectObjetRequestManage();
		ArrayList<ReportBoard> reportblist = (ArrayList<ReportBoard>) reportbService.selectReportMain();
		ArrayList<Qna>qnalist = (ArrayList<Qna>) qnaService.selectQnaListAdmin();
		ArrayList<ReportUDetail> reportulist= (ArrayList<ReportUDetail>) usermService.selectReportUDetailMain();
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectAllObet();
		ArrayList<UserManagement> userlist = (ArrayList<UserManagement>) usermService.selectUser();
		ArrayList<String> objettag = new ArrayList<String>();
		ArrayList<Users> enrollcount = (ArrayList<Users>) usermService.selectEnrollCount();
		
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
		
		
		for(int i = 0; i < objetmlist.size(); i++) {
			String[] tag = objetmlist.get(i).getObjettag().split(","); 
			for(int j = 0; j < tag.length; j++) {
				objettag.add(tag[j]);
			}
		}
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
	public void updateLoginCount(HttpServletResponse response) throws IOException {
		Date currenttime = new Date(System.currentTimeMillis());
		//현재 년/월/일
		if( usermService.selectLoginDate() == null ) {
			usermService.insertLoginCount();
		}
	}
	
}
