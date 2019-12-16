package com.kh.objet.users.controller;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.blacklist.model.vo.BlackList;
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
		ArrayList<BlackList> bklist = (ArrayList<BlackList>) usermService.selectBlacklist();
		if (bklist != null) {
			mv.addObject("bklist", bklist);
			mv.setViewName("admin/userBlacklist");
		} else {
			mv.addObject("message", "블랙리스트 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
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












