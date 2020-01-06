package com.kh.objet.objet.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import com.kh.objet.users.model.vo.UserManagement;


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
		ArrayList<Objet> objetreqlist = (ArrayList<Objet>) objetmService.selectObjetRequestManage();
		ArrayList<ReportBoard> reportblist = (ArrayList<ReportBoard>) reportbService.selectReportMain();
		ArrayList<Qna>qnalist = (ArrayList<Qna>) qnaService.selectQnaMain();
		ArrayList<ReportUDetail> reportulist= (ArrayList<ReportUDetail>) usermService.selectReportUDetailMain();
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectAllObet();
		ArrayList<UserManagement> userlist = (ArrayList<UserManagement>) usermService.selectUser();
		ArrayList<String> objettag = new ArrayList<String>();
		
		for(int i = 0; i < objetmlist.size(); i++) {
			String[] tag = objetmlist.get(i).getObjettag().split(","); 
			for(int j = 0; j < tag.length; j++) {
				objettag.add(tag[j]);
			}
		}
		System.out.println(objettag);
		model.addAttribute("objettag", objettag);
		model.addAttribute("objetreqlist", objetreqlist);
		model.addAttribute("objetmlist", objetmlist);
		model.addAttribute("reportblist", reportblist);
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("reportulist", reportulist);
		model.addAttribute("userlist", userlist);
		return "admin/adminmain"; 
	}

}
