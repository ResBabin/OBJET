package com.kh.objet.users.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.objet.users.model.service.UsersServiceImpl;
import com.kh.objet.users.model.vo.Users;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersServiceImpl usersService;
	
	// 패스워드 암호화 
		@Autowired
		public BCryptPasswordEncoder bcPwdEncoder;
	
	public UsersController() {};
	
	
	// 최민영 ****************************************************************************************
	// 로그인관련 -----------------------------------------------
	// 회원가입 페이지 이동
		@RequestMapping("moveEnrollPage.do")
		public String moveEnrollPage() {
			return "user/enrollPage";
		}
		
	// 회원가입
		@RequestMapping(value="insertUsers.do", method=RequestMethod.POST)
		public String insertUsers(Users users, Model model) {
			users.setUserpwd(bcPwdEncoder.encode(users.getUserpwd()));
			
			int result = usersService.insertUsers(users);
			
			String vfn = "user/enrollSuccess";
			if(result <= 0) {
				vfn = "common/error";
				model.addAttribute("message", "회원가입 실패!");
			}
			 return vfn;
		}

			
	// 로그인 페이지 이동
		@RequestMapping("moveLogin.do")
		public String moveLoginPage() {
			return "user/login";
		}
	
	// 회원 로그인
		@RequestMapping(value="login.do", method=RequestMethod.POST)
		public String selectUsersLogin(Users users, HttpSession session, Model model) {
			Users loginMember = usersService.selectUsersLogin(users);
			
			if(loginMember != null) {
				session.setAttribute("loginMember", loginMember);
				return "main";
			}else {
				model.addAttribute("message", "로그인 실패!");
				return "common/error";
			}
		}
	
	// 아이디 찾기 이동
		@RequestMapping("moveFindUserid.do")
		public String moveFindId() {
			return "user/findUserid";
		}
		
	// 아이디찾기
		@RequestMapping("findId.do")
		public String selectFindId() {
			//성공시 "user/findIdSuccess"
			//실패시 "user/findIdFail"
			return "user/findIdSuccess";
		}
	
		
		
	// 비밀번호 찾기 이동 페이지 이동
		@RequestMapping("moveFindUserpwd.do")
		public String moveFindUserpwd() {
			return "user/findUserpwd";
		}
		
	// 비밀번호 찾기
		@RequestMapping("findPwd.do")
		public String selectFindPwd() {
			//성공시 "user/findPwdSuccess"
			//실패시 "user/findPwdFail"
			return "user/findPwdSuccess";
		}

		
	
	// 내정보 수정 페이지 이동
		@RequestMapping("moveMyPageEdit.do")
		public String moveMyPageEdit() {
			return "user/mypageEdit";
		}
		
	// 내정보 수정
		@RequestMapping("updateMyPage.do")
		public String updateMyPage() {
			return "main";
		}
		
	// 탈퇴페이지 이동
		@RequestMapping("moveQuitPage.do")
		public String moveQuitPage() {
			return "user/quitPage";
		}
		
	// 회원탈퇴
		@RequestMapping("updateQuitUser.do")
		public String updateQuitUser() {
			// users테이블 업데이트 후 탈퇴테이블 insertQuitUser()도 해야함.
			// 회원탈퇴 성공 시 "user/quitSuccess"
			// 실패 시 "common/error"
			return "user/quitSuccess";
		}

		
	// 작가홈 관련 -----------------------------------------------
	// 작가홈 이동
		@RequestMapping(value="artistHomeMain.do", method=RequestMethod.GET)
		public String moveArtistHome() {
			return "artistHome/artistHomeMain";
		}
		
	// 작가 신고하기 페이지 이동
		@RequestMapping("moveProfileReport.do")
		public String moveProfileReport() {
			return "artistHome/profileReport";
		}
		
	// 작가 신고하기
		@RequestMapping("insertUsersReport.do")
		public String insertUsersReport() {
			return "artistHome/artistHomeMain";
		}
		

			
}
