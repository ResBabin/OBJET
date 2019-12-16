package com.kh.objet.users.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.objet.users.model.service.UsersServiceImpl;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersServiceImpl usersService;
	
	public UsersController() {};
	
	
	// 최민영 ****************************************************************************************
	// 로그인관련 -----------------------------------------------
	// 로그인 페이지 이동
	@RequestMapping("moveLogin.do")
		public String moveLoginPage() {
			return "user/login";
		}
	
	// 아이디 찾기 이동
		@RequestMapping("moveFindUserid.do")
		public String moveFindId() {
			return "user/findUserid";
		}
	
	// 아이디 찾기 성공 페이지 이동
		@RequestMapping("moveFindIdSuccess.do")
		public String moveFindIdSuccess() {
			return "user/findIdSuccess";
		}
	
	// 아이디 찾기 실패 페이지 이동
		@RequestMapping("moveFindIdFail.do")
		public String moveFindIdFail() {
			return "user/findIdFail";
		}
	
	// 비밀번호 찾기 이동 페이지 이동
		@RequestMapping("moveFindUserpwd.do")
		public String moveFindUserpwd() {
			return "user/findUserpwd";
		}
		
	// 비번 찾기 성공 페이지 이동
		@RequestMapping("moveFindPwdSuccess.do")
		public String moveFindPwdSuccess() {
			return "user/findPwdSuccess";
		}
	
	// 비번 찾기 실패 페이지 이동
		@RequestMapping("moveFindPwdFail.do")
		public String moveFindPwdFail() {
			return "user/findPwdFail";
		}	
		
		
	// 회원가입 페이지 이동
		@RequestMapping("moveEnrollPage.do")
		public String moveEnrollPage() {
			return "user/enrollPage";
		}
		
	// 회원가입 완료 페이지 이동
		@RequestMapping("moveEnrollSuccess.do")
		public String moveEnrollSuccessPage() {
			return "user/enrollSuccess";
		}
		
		
	// 내정보 수정 페이지 이동
		@RequestMapping("moveMyPageEdit.do")
		public String moveMyPageEdit() {
			return "user/mypageEdit";
		}
		
	// 탈퇴페이지 이동
		@RequestMapping("moveQuitPage.do")
		public String moveQuitPage() {
			return "user/quitPage";
		}
	
	// 탈퇴완료 페이지 이동
		@RequestMapping("moveQuitSuccess.do")
		public String moveQuitSuccessPage() {
			return "user/quitSuccess";
		}
		
	// 작가홈 관련 -----------------------------------------------
	
	// 작가홈 이동
		@RequestMapping(value="artistHomeMain.do", method=RequestMethod.GET)
		public String moveArtistHome() {
			return "artistHome/artistHomeMain";
		}
		
		
	// 작가소개수정 이동
		@RequestMapping("moveArtistIntroEdit.do")
		public String moveArtistIntroEdit() {
			return "artistHome/artistIntroEdit";
		}
			
	// 팔로잉 보기
		@RequestMapping("moveFollowingPage.do")
		public String moveFollowingPage() {
			return "artistHome/following";
		}
		
	// 팔로워 보기
		@RequestMapping("moveFollowerPage.do")
		public String moveFollowerPage() {
			return "artistHome/follower";
		}
		
	// 작가 신고하기 페이지 이동
		@RequestMapping("moveProfileReport.do")
		public String moveProfileReport() {
			return "artistHome/profileReport";
		}
			
}
