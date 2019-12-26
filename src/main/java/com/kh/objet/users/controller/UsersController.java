package com.kh.objet.users.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

import com.kh.objet.quit.model.vo.Quit2;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.service.UsersServiceImpl;
import com.kh.objet.users.model.vo.UAUP;
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
		
		// 이메일 중복확인
		@RequestMapping(value="checkEmail.do", method=RequestMethod.POST)
		public void selectCheckEmail(@RequestParam(value="email") String email, HttpServletResponse response) throws IOException {
			
			logger.info("email : " + email);
			int result = usersService.selectCheckEmail(email);

			
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
			//users.setUserpwd(bcryptPasswordEncoder.encode(users.getUserpwd()));
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
		public String selectUsersLogin(UAUP users, HttpSession session, Model model) {
			
			UAUP loginUser = usersService.selectUsersLogin(users);
			
			String vfn = "main";
			if(loginUser != null) {
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
			return "main";
		}
	
	// 아이디 찾기 이동
		@RequestMapping("moveFindUserid.do")
		public String moveFindId() {
			return "user/findUserid";
		}
		
	// 아이디찾기
		@RequestMapping("findUserid.do")
		public String selectFindId(Users users, Model model) {
			Users findUser = usersService.selectFindId(users);
			
			String vfn = null;
			if(findUser != null) {
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
		@RequestMapping("findUserpwd.do")
		public String selectFindPwd(Users users, Model model) {
			String vfn = null;
			
			Users result1 = usersService.selectFindPwd(users);
		
			if(result1 != null) {
				// 조회결과가 있다면 임시비밀번호 발급
				int index = 0;  
		        char[] charSet = new char[] {  
		                '0','1','2','3','4','5','6','7','8','9'    
		                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
		                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};  
		          
		        StringBuffer sb = new StringBuffer();  
		        for (int i=0; i<8; i++) {  
		            index =  (int)(Math.random()*charSet.length);  
		            sb.append(charSet[index]);  
		        }  
		        
		        String tempPwd = sb.toString();
		        
		        // 임시비밀번호로 값 저장
		        users.setUserpwd(tempPwd);
		        
		        // 임시비밀번호로 업데이트
				int result2 = usersService.updateUserPwd(users);
				
				if(result2 > 0) {
					Users findPwd = usersService.selectFindPwd(users);
					model.addAttribute("findPwd", findPwd);
					vfn = "user/findPwdSuccess";
				}
				
			}else {
				vfn = "user/findPwdFail";
			}
			
			return vfn;
		}

		
	
	// 내정보 수정 페이지 이동
		@RequestMapping("moveMyPageEdit.do")
		public String moveMyPageEdit(HttpSession session, Model model) {
			String vfn = null;
			
			if(session != null) {
				UAUP loginUser = (UAUP)session.getAttribute("loginUser");
				Users user = usersService.moveMyPageEdit(loginUser.getUserid());
				model.addAttribute("user", user);
				vfn = "user/mypageEdit";
			} else {
				vfn = "common/error";
				model.addAttribute("message", "내정보 수정 페이지 조회 실패!");
			}
			return vfn;
		}
		
	// 비밀번호 재확인 페이지 이동
		@RequestMapping("moveReaffirmUserpwd.do")
		public String moveReaffirmUserpwd() {
			return "user/reaffirmUserpwd";
		}
		
			
	// 비밀번호 재확인 페이지 이동
	@RequestMapping("reaffirmUserpwd.do")
	public String reaffirmUserpwd(UAUP users, Model model) {
		UAUP loginUser = usersService.selectUsersLogin(users);
		String vfn = null;
		if(loginUser != null) 
			vfn = "user/mypageEdit";
		else {
			vfn = "user/reaffirmUserpwd";
			model.addAttribute("message", "비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		}
		return vfn;
			
	}
		
	// 내정보 수정
		@RequestMapping("updateMyPage.do")
		public void updateMyPage(Users users, HttpServletResponse response) throws IOException {
			int result = usersService.updateMyPage(users);
			String returnValue = null;
			if(result > 0) 
				returnValue = "ok";
			else
				returnValue = "fail";
				
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}
		
	// 탈퇴페이지 이동
		@RequestMapping("moveQuitPage.do")
		public String moveQuitPage() {
			return "user/quitPage";
		}
		
	// 회원탈퇴
		@RequestMapping("updateQuitUser.do")
		public String updateQuitUser(Quit2 quit, HttpServletRequest request, HttpSession session, Model model) {
			int result1, result2 = 0;
			String vfn = null;
			if(quit.getQuitreason().equals("기타")) {
				quit.setQuitreason(quit.getQuitreasonDetail());
			}
			
			String userid = quit.getUserid();
			result1 = usersService.updateQuitUser(userid);
			
			if(result1 > 0) {
				result2 = usersService.insertQuitUser(quit);
				if(result2 > 0)
					session = request.getSession(false);
				if(session != null) {
					//세션 객체가 존재한다면 없애기
					session.invalidate();
				}
				vfn = "user/quitSuccess";
			}else {
				vfn = "common/error";
				model.addAttribute("message", "회원탈퇴 실패!");
			}
			return vfn;
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
