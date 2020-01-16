package com.kh.objet.support.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.support.model.service.SupportServiceImpl;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.users.model.service.UsersServiceImpl;
import com.kh.objet.users.model.vo.UAUP;


@Controller
public class SupportController {
	
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private SupportServiceImpl supportService;
	
	@Autowired
	private UsersServiceImpl usersService;
	
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
	
	

}



