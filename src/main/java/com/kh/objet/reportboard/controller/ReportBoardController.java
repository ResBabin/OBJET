package com.kh.objet.reportboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
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

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportboard.model.service.ReportBoardService;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.users.controller.UserManagementController;
import com.kh.objet.users.model.vo.UserManagement;

@Controller
public class ReportBoardController {
	private static final Logger logger = LoggerFactory.getLogger(UserManagementController.class);
	
	@Autowired
	private ReportBoardService reportbService; 
	
	public ReportBoardController() {}
	
	@RequestMapping("reportbm.do")
	public String selectReportBList (Model model) {
		ArrayList<ReportBoard> reportblist = (ArrayList<ReportBoard>)reportbService.selectReportBList();  
		ArrayList<ReportBoard> reportbm = (ArrayList<ReportBoard>) reportbService.selectReportAll();
		model.addAttribute("reportblist", reportblist);
		model.addAttribute("reportall", reportbm);
		return  "admin/reportBoardList";
	}
	
	@RequestMapping("reportbmd.do")
	public String selectReportBDetail (HttpServletRequest request, Model model) {
		//신고상세조회
		Map<String, String> map = new HashMap<>();
		map.put("rptype", request.getParameter("rptype"));
		map.put("originno", request.getParameter("originno"));
		map.put("reportedb", request.getParameter("reportedb"));
		ReportBoard reportbmd = reportbService.selectReportBDetail(map);
		model.addAttribute("reportbmd", reportbmd);
		return "admin/reportBoardDetail";
	}
	
	@RequestMapping(value="reportd.do", method=RequestMethod.POST)
	public void BlacklistOrder(ReportBoard report, HttpServletResponse response) throws IOException {
		ArrayList<ReportBoard> reportall = (ArrayList<ReportBoard>) reportbService.selectReportAllList(report);
		//전송용 json 객체
				JSONObject sendJson = new JSONObject();
				//json 배열 객체
				JSONArray jarr = new JSONArray();
				//list를 jarr 로 옮겨 저장 (복사)
				for( ReportBoard reportb : reportall) {
					
				JSONObject job = new JSONObject();
				job.put("id", reportb.getReporterb());
				job.put("reason", URLEncoder.encode(reportb.getReportbreason(), "utf-8"));
				jarr.add(job);
				}
				
				sendJson.put("list", jarr);
				logger.debug(jarr.toJSONString());
				response.setContentType("application/jsonl charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(sendJson.toJSONString());
				out.flush();
				out.close();
				
	}
	
}

















