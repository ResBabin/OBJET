package com.kh.objet.reportboard.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.reportboard.model.service.ReportBoardService;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.users.controller.UserManagementController;

@Controller
public class ReportBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserManagementController.class);
	
	@Autowired
	private ReportBoardService reportbService; 
	
	public ReportBoardController() {}
	
	@RequestMapping("reportbm.do")
	public String selectReportBList (Model model) {
		ArrayList<ReportBoard> reportblist = (ArrayList<ReportBoard>)reportbService.selectReportBList();  
		model.addAttribute("reportblist", reportblist);
		return  "admin/reportBoardList";
	}
	
	@RequestMapping("reportbmd.do")
	public String selectReportBDetail (@RequestParam("reportb") String reportb, Model model) {
		ReportBoard reportbmd = reportbService.selectReportBDetail(reportb);
		model.addAttribute("reportbmd", reportbmd);
		return "admin/reportBoardDetail";
	}
	
	
	
}

















