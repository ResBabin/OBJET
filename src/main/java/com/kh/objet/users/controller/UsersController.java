package com.kh.objet.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.quit.model.vo.Quit;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.service.UsersServiceImpl;
import com.kh.objet.users.model.vo.Users;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersServiceImpl usersService;
	
	// 패스워드 암호화 
		@Autowired
		public BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public UsersController() {};
	
	
	// 최민영 ****************************************************************************************
	// 로그인관련 -----------------------------------------------
	// 회원가입 페이지 이동
		@RequestMapping("moveEnrollPage.do")
		public String moveEnrollPage() {
			return "user/enrollPage";
		}
		
	// 아이디 중복확인
		@RequestMapping(value="checkId.do", method=RequestMethod.POST)
		public void selectCheckId(@RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException {
			
			logger.info("userid : " + userid);
			int result = usersService.selectCheckId(userid);

			
			String returnValue = null;
			
			if(result < 1) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}
		
	// 닉네임 중복확인
		@RequestMapping(value="checkNickname.do", method=RequestMethod.POST)
		public void selectCheckNickname(@RequestParam(value="nickname") String nickname, HttpServletResponse response) throws IOException {
			
			logger.info("nickname : " + nickname);
			int result = usersService.selectCheckNickname(nickname);

			
			String returnValue = null;
			
			if(result < 1) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}
		
		
	// 회원가입
		@RequestMapping(value="insertUsers.do", method=RequestMethod.POST)
		public String insertUsers(Users users, Model model) {
			users.setUserpwd(bcryptPasswordEncoder.encode(users.getUserpwd()));
			int result1, result2 = 0;
			
			result1 = usersService.insertUsers(users);	// users 테이블 추가
			if(result1 > 0) {
				result2 = usersService.insertUsersProfile(users.getUserid());	// usersprofile 테이블 추가
			}
			
			
			String vfn = "user/enrollSuccess";
			if(result1 <= 0 || result2 <= 0) {
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
			
			Users loginUser = usersService.selectUsersLogin(users);
			
			String vfn = "main";
			if(loginUser != null && bcryptPasswordEncoder.matches(users.getUserpwd(), loginUser.getUserpwd())) {
				session.setAttribute("loginUser", loginUser);
			}else {
				vfn = "user/loginAgain";
			}
			return vfn;
	}
			
			
			
			
			
		
		
	// 회원 로그아웃
		@RequestMapping("logout.do")	
		public String usersLogout(HttpServletRequest request) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			return "user/login";
		}
	
	// 아이디 찾기 이동
		@RequestMapping("moveFindUserid.do")
		public String moveFindId() {
			return "user/findUserid";
		}
		
	// 아이디찾기
		@RequestMapping("findUserid.do")
		public String selectFindId(Users users, Model model) {
			ArrayList<Users> findUser = usersService.selectFindId(users);
			
			String vfn = null;
			if(findUser.size() > 0) {
				model.addAttribute("findUser", findUser);
				vfn = "user/findIdSuccess";
			} else {
				vfn =  "user/findIdFail";
			}
			//성공시 "user/findIdSuccess"
			//실패시 "user/findIdFail"
			return vfn;
		}
	
		
		
	// 비밀번호 찾기 이동 페이지 이동
		@RequestMapping("moveFindUserpwd.do")
		public String moveFindUserpwd() {
			return "user/findUserpwd";
		}
		
	// 비밀번호 찾기
		@RequestMapping("findPwd.do")
		public String selectFindPwd(Users users, Model model) {
			//성공시 "user/findPwdSuccess"
			//실패시 "user/findPwdFail"
			return "user/findPwdSuccess";
		}

		
	
	// 내정보 수정 페이지 이동
		@RequestMapping("moveMyPageEdit.do")
		public String moveMyPageEdit(@RequestParam(value="userid") String userid) {
			return "user/mypageEdit";
		}
		
	// 내정보 수정
		@RequestMapping("updateMyPage.do")
		public String updateMyPage(Users users, Model model) {
			return "main";
		}
		
	// 탈퇴페이지 이동
		@RequestMapping("moveQuitPage.do")
		public String moveQuitPage() {
			return "user/quitPage";
		}
		
	// 회원탈퇴
		@RequestMapping("updateQuitUser.do")
		public String updateQuitUser(Quit quit, Model model) {
			// users테이블 업데이트 후 탈퇴테이블 insertQuitUser()도 해야함.
			// 회원탈퇴 성공 시 "user/quitSuccess"
			// 실패 시 "common/error"
			return "user/quitSuccess";
		}


		
	// 작가 신고하기 페이지 이동
		@RequestMapping("moveProfileReport.do")
		public String moveProfileReport(@RequestParam(value="artistid") String artistid) {
			return "artistHome/profileReport";
		}
		
	// 작가 신고하기
		@RequestMapping("insertUsersReport.do")
		public String insertUsersReport(ReportUDetail reportUDetail, Model model) {
			return "artistHome/artistHomeMain";
		}
		

			
}
