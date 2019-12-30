package com.kh.objet.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.service.UserManagementService;
import com.kh.objet.users.model.vo.UserManagement;

@Controller
public class UserManagementController {

	private static final Logger logger = LoggerFactory.getLogger(UserManagementController.class);
	
	@Autowired
	private UserManagementService usermService;

	public UserManagementController() {
	}

/*	@RequestMapping("userm.do")
	public String usermPage() {
		return "admin/userManagement";
	}*/
	
	@RequestMapping("userm.do")
	public ModelAndView userList(ModelAndView mv) {
		ArrayList<UserManagement> ulist = (ArrayList<UserManagement>) usermService.selectUser();
		
		if (ulist != null) {
			mv.addObject("ulist", ulist);
			mv.setViewName("admin/userManagement");
		} else {
			mv.addObject("message", "회원 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	@RequestMapping("userbk.do")
	public ModelAndView Blacklist(ModelAndView mv) {
		ArrayList<UserManagement> bklist = (ArrayList<UserManagement>) usermService.selectBlacklist();
		if (bklist != null) {
			mv.addObject("bklist", bklist);
			mv.setViewName("admin/userBlacklist");
		} else {
			mv.addObject("message", "블랙리스트 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	@RequestMapping(value="userbkorder.do", method=RequestMethod.POST)
	public void BlacklistOrder(String order, HttpServletResponse response) throws IOException {
		ArrayList<UserManagement> bklist = (ArrayList<UserManagement>) usermService.selectBlacklistOrder(order);
		//전송용 json 객체
				JSONObject sendJson = new JSONObject();
				//json 배열 객체
				JSONArray jarr = new JSONArray();
				//list를 jarr 로 옮겨 저장 (복사)
				for( UserManagement userbk : bklist) {
					
				JSONObject job = new JSONObject();
				job.put("userid", userbk.getUserid());
				job.put("username", URLEncoder.encode(userbk.getUsername(), "utf-8"));
				job.put("nickname", URLEncoder.encode(userbk.getNickname(), "utf-8"));
				job.put("blackstart", userbk.getBlackstart().toString());
				job.put("blackend", userbk.getBlackend().toString());
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
	
	@RequestMapping("usermd.do")
	public ModelAndView userMangeDetail(ModelAndView mv, @RequestParam("userid") String userid) {
		UserManagement usermd = usermService.selectUserDetail(userid);
		ArrayList<Objet> userob = (ArrayList<Objet>) usermService.selectUserObjet(userid);
		ArrayList<ReportUDetail> userrp = (ArrayList<ReportUDetail>) usermService.selectUserReport(userid);
		ArrayList<ReportUDetail> userrpt = (ArrayList<ReportUDetail>) usermService.selectUserReportTotal(userid);
		  if(usermd != null) {
		         mv.addObject("usermd", usermd);
		         mv.addObject("userob", userob);
		         mv.addObject("userrp", userrp);
		         mv.addObject("userrpt", userrpt);
		         mv.setViewName("admin/userManageDetail");
		      }else {
		         mv.addObject("message", "회원 정보 보기 실패!");
		         mv.setViewName("common/error");
		      }
		      return mv;
	}
}












