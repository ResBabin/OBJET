package com.kh.objet.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.quit.model.vo.Quit2;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.service.UserManagementService;
import com.kh.objet.users.model.service.UsersServiceImpl;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.users.model.vo.Users;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersServiceImpl usersService;
	@Autowired
	private UserManagementService usermService;
	@Autowired
	private ObjetServiceImpl objetService;
	
	
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
		public String moveLoginPage(Model model) {
			return "user/login";
		}
		
		
		
	/*// 회원 로그인
		@RequestMapping(value="login.do", method= {RequestMethod.POST, RequestMethod.GET})
		public String selectUsersLogin(UAUP users, HttpSession session, Model model) {
			
			UAUP loginUser = usersService.selectUsersLogin(users);
			
			String vfn = "main";
			if(loginUser != null) {
				if(loginUser.getQuityn().equals("N")) {
					session.setAttribute("loginUser", loginUser);
					if(loginUser.getUsertype().equals("USER")){
						Date currenttime = new Date(System.currentTimeMillis());
						SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
						String updatecount = sdf2.format(currenttime);
						String upcount = "login" + updatecount;
						usermService.updateLoginCount(upcount);
					}else {
						vfn = "redirect:/adminmain.do";
					}
				}else {
					vfn = "user/loginAgain";
					model.addAttribute("message", "탈퇴한 계정입니다. 탈퇴일로부터 30일 내에는 동일한 이메일로 재가입이 불가능합니다.");
				}
			}else {
				vfn = "user/loginAgain";
			}
			return vfn;
	}*/
		
		
	// 회원 로그인
	@RequestMapping(value="login.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String selectUsersLogin(UAUP users, HttpSession session, Model model) {
			ArrayList<Artist> searchMainList = objetService.selectArtistAllList();
			Collections.shuffle(searchMainList);
			ArrayList<Objet> objetList = objetService.selectAllObjetAllList();
			ArrayList<Objet> objetAllList = objetService.selectObjetAllList();
			ArrayList<Artist> objetMainList = objetService.selectObjetMainList();
			Collections.shuffle(objetMainList);
			
			UAUP loginUser = usersService.selectUsersLogin(users);
			
			String vfn = "main";
			if(loginUser != null) {
				if(loginUser.getQuityn().equals("N")) {
					session.setAttribute("loginUser", loginUser);
					if(loginUser.getUsertype().equals("USER")){
						Date currenttime = new Date(System.currentTimeMillis());
						SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
						String updatecount = sdf2.format(currenttime);
						String upcount = "login" + updatecount;
						usermService.updateLoginCount(upcount);
					}else {
						vfn = "redirect:/adminmain.do";
					}
				}else {
					vfn = "user/login";
					model.addAttribute("loginFail", "로그인 실패!");
					model.addAttribute("message", "탈퇴한 계정입니다. 탈퇴일로부터 30일 내에는 동일한 이메일로 재가입이 불가능합니다.");
				}
			}else {
				vfn = "user/login";
				model.addAttribute("loginFail", "로그인 실패!");
				model.addAttribute("message", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			}
			
			if(searchMainList != null && objetList != null && objetAllList != null && objetMainList != null) {
				model.addAttribute("searchMainList", searchMainList);
				model.addAttribute("objetList", objetList);
				model.addAttribute("objetAllList", objetAllList);
				model.addAttribute("objetMainList", objetMainList);
			}else {
				model.addAttribute("searchMainList", searchMainList);
				model.addAttribute("objetList", objetList);
				model.addAttribute("objetAllList", objetAllList);
				model.addAttribute("objetMainList", objetMainList);
				vfn = "common/error";
			}
			
			return vfn;
		}	
		
		
	// 네이버 로그인(자동 가입 시키기)
		@RequestMapping(value="naverlogin.do", method= {RequestMethod.POST, RequestMethod.GET})
		public String naverlogin(@RequestParam(value="username") String username,@RequestParam(value="email") String email,@RequestParam(value="gender") String gender, @RequestParam(value="naverid") int naverid, HttpSession session, Model model) {
			String vfn = null;
			//System.out.println("username >>> " + username + ",  email >>> " + email + ",  gender >>> " + gender + ",  naverid >>> " + naverid);
			
			// 0. 네이버 아이디 고유번호로 가입되어 있는지 조회
			UAUP user = new UAUP();
			user.setNaverid(naverid);
			user = usersService.selectNaverLogin(user);
			
			if(user != null) {
				if(user.getQuityn().equals("N")) {
				// 1. 가입되어 있고 탈퇴하지 않았으면 아이디와 비밀번호 가져와서 로그인 처리(세션부여) 해주고 메인으로 보내기
					session.setAttribute("loginUser", user);
					vfn = "redirect:/main.do";
				}else {
					model.addAttribute("message", "탈퇴한 계정입니다. 탈퇴일로부터 30일 내에는 동일한 이메일로 재가입이 불가능합니다.");
					vfn = "user/login";
				}

			}else {
				// 2. 가입 되어 있지 않으면, 해당 네이버 계정으로 연동은 안되어있지만 이미 가입된 오브제 계정이 있는지 확인 
				int result = usersService.selectNaverMail(email);
				
				if(result > 0) {
					// 2-1. 동일한 네이버 아이디로 가입된 계정이 있다면 오브제 계정으로 안내
					vfn = "user/loginAgain";
					model.addAttribute("message", "해당 네이버 아이디로 가입된 오브제 계정이 존재합니다. 오브제 계정으로 로그인해주세요.");
				}else {
					// 2-2. 가입된 계정이 없다면 네이버에서 넘어온 값들 가지고 회원가입 추가정보 입력페이지로 이동
					vfn = "user/enrollPageNaver";
					model.addAttribute("naverid", naverid);
					model.addAttribute("username", username);
					model.addAttribute("email", email);
					model.addAttribute("gender", gender);
				} 
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
			return "redirect:main.do";
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
		@RequestMapping(value="findUserpwd.do", method=RequestMethod.POST)
		public String selectFindPwd(Users users, Model model) {
			String vfn = null;
			
			Users result1 = usersService.selectFindPwd(users);
		
			if(result1 != null) {
				// 조회결과가 있다면 임시비밀번호 메일 발급

                //mail server 설정
                String user = "hdamoa05"; //자신의 네이버 계정
                String password = "dhqmwp123@";//자신의 네이버 패스워드
             
                
                //SMTP 서버 정보 설정
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.naver.com");
                props.put("mail.smtp.port", 465);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.ssl.enable", "true");
                props.put("mail.smtp.ssl.trust", "smtp.naver.com");
                
                
                // SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user,password);
                    }
                });
                
                //메일 받을 주소
                String to_email = result1.getEmail();
                
                // 임시비밀번호 생성
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
		        logger.info(tempPwd);
                
                
		        // 임시비밀번호로 값 저장
		        users.setUserpwd(tempPwd);
		        
		        // 임시비밀번호로 업데이트
				int result2 = usersService.updateUserPwd(users);
				
				if(result2 > 0) {
					// 업데이트 성공시 email 전송
					try {
	                    MimeMessage msg = new MimeMessage(session);
	                    msg.setFrom(new InternetAddress(user, "Objet"));
	                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
	                    
	                    //메일 제목
	                    msg.setSubject("[Objet] 오브제 임시 비밀번호  메일입니다.");
	                    //메일 내용
	                    //msg.setText("안녕하세요. 오브제 고객님.\n요청하신 임시 비밀번호는 다음과 같습니다.\n\n * 임시 비밀번호 : <p style='font-weight:600; color: blue;'>" + tempPwd + "</p> \n개인정보 보호를 위해 임시 비밀번호를 사용해서 로그인 하신 후 바로 비밀번호를 변경해주십시오.\n\n다른 문의 사항이 있으시면 오브제 고객센터(070-1111-2222)로 문의해주시기 바랍니다.\n\n감사합니다.");
	                    
	                    msg.setContent("안녕하세요. 오브제 고객님.<br>요청하신 임시 비밀번호는 다음과 같습니다.<br><br>* 임시 비밀번호 : <span style='font-weight:600; color: blue;'>" + tempPwd + "</span>"
	                    		+ "<br><br>개인정보 보호를 위해 임시 비밀번호를 사용해서 로그인 하신 후 바로 비밀번호를 변경해주십시오.<br>다른 문의 사항이 있으시면 오브제 고객센터(070-1111-2222)로 문의해주시기 바랍니다.<br>감사합니다."
	                    		, "text/html; charset=utf-8");
	                    Transport.send(msg);
	                    logger.info("Success Message Send!");
	                    
	                }catch (Exception e) {
	                    e.printStackTrace();
	                }
					
					model.addAttribute("email", result1.getEmail());
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
		
	// 비밀번호 재확인 페이지 이동(오브제회원&네이버회원)
		@RequestMapping("moveReaffirmUserpwd.do")
		public String moveReaffirmUserpwd() {
			return "user/reaffirmUserpwd";
		}
		
			
	// 내정보 수정시 비밀번호 재확인(오브제회원)
	@RequestMapping("reaffirmUserpwd.do")
	public String reaffirmUserpwd(UAUP users, Model model) {
		UAUP loginUser2 = usersService.selectUsersLogin(users);
		String vfn = null;
		if(loginUser2 != null) {
			vfn = "user/mypageEdit";
			model.addAttribute("loginUser2", loginUser2);
		}else {
			vfn = "user/reaffirmUserpwd";
			model.addAttribute("message", "입력 정보가 일치하지 않습니다. 다시 입력해주세요");
		}
		return vfn;
			
	}
	
	// 내정보 수정시 비밀번호 재확인(네이버회원)
		@RequestMapping("reaffirmEmail.do")
		public String ReaffirmEmail(UAUP users, Model model) {
			UAUP loginUser2 = usersService.selectNaverUsersLogin(users);
			String vfn = null;
			if(loginUser2 != null) {
				vfn = "user/mypageEdit";
				model.addAttribute("loginUser2", loginUser2);
			}else {
				vfn = "user/reaffirmUserpwd";
				model.addAttribute("message", "비밀번호가 일치하지 않습니다. 다시 입력해주세요");
			}
			return vfn;
				
		}
		
	// 내정보 수정
		@RequestMapping(value="updateMyPage.do", method=RequestMethod.POST)
		public String updateMyPage(Users users, Model model, HttpServletRequest request) {
			int result = usersService.updateMyPage(users);
			ArrayList<Artist> searchMainList = objetService.selectArtistAllList();
			Collections.shuffle(searchMainList);
			ArrayList<Objet> objetList = objetService.selectAllObjetAllList();
			ArrayList<Objet> objetAllList = objetService.selectObjetAllList();
			ArrayList<Artist> objetMainList = objetService.selectObjetMainList();
			Collections.shuffle(objetMainList);
			
			String vfn = null;
			
			if(result > 0) {
				// 업데이트 성공하면 세션 가져와 로그아웃 후 재로그인 하게 만들기
				HttpSession session = request.getSession(false);
				if(session != null) {
					session.invalidate();
				}
				vfn = "main";
				model.addAttribute("message", "내 정보 수정에 성공하였습니다. 다시 로그인해주세요.");
			}else {
				vfn = "message";
				model.addAttribute("message", "내 정보 수정에 실패하여 메인페이지로 이동합니다.");
			}
			
			if(searchMainList != null && objetList != null && objetAllList != null && objetMainList != null) {
				model.addAttribute("searchMainList", searchMainList);
				model.addAttribute("objetList", objetList);
				model.addAttribute("objetAllList", objetAllList);
				model.addAttribute("objetMainList", objetMainList);
			}else {
				model.addAttribute("searchMainList", searchMainList);
				model.addAttribute("objetList", objetList);
				model.addAttribute("objetAllList", objetAllList);
				model.addAttribute("objetMainList", objetMainList);
				vfn = "common/error";
			}
			
			return vfn;
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
		public String moveProfileReport(@RequestParam(value="reportedu") String reportedu, Model model) {
			model.addAttribute("reportedu", reportedu);
			return "artistHome/profileReport";
		}
		
	// 작가 신고하기
		@RequestMapping("insertUsersReport.do")
		public void insertUsersReport(ReportUDetail reportUDetail, @RequestParam(value="etc") String etc, HttpServletResponse response, Model model) throws IOException {
			int result1, result2 = 0;
			// 기타 사유가 있으면
			if(reportUDetail.getReportureason().equals("기타")) {
				reportUDetail.setReportureason(etc);
			}
			
			String returnValue = null;
			// 7일 이내 중복 신고가 있는지 확인
			result1 = usersService.selectUsersReportOverlap(reportUDetail);
			if(result1 > 0) {
				returnValue = "overlap";
			} else {
				// 중복 신고가 없다면
				result2 = usersService.insertUsersReport(reportUDetail);
				if(result2 > 0) 
					returnValue = "ok";
				else 
					returnValue = "fail";
			}
			
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		}
		
	
		
		
		
		
		
	// footer 이동 컨트롤러 ===============================
		
		// 청소년보호정책
		@RequestMapping("safeguard")
		public String safeguard() {
			return "common/safeguard";
		}
		
		// 운영정책
		@RequestMapping("oppolicy.do")
		public String oppolicy() {
			return "common/oppolicy";
		}
		
		// 이용약관
		@RequestMapping("terms.do")
		public String terms() {
			return "common/terms";
		}
		
		// 개인정보처리방침
		@RequestMapping("privacy.do")
		public String privacy() {
			return "common/privacy";
		}
		
		// 오브제 이용안내
		@RequestMapping("pageIntro.do")
		public String pageIntro() {
			return "common/pageIntro";
		}
		
		// 오브제 팀소개
		@RequestMapping("objetTeam.do")
		public String objetTeam() {
			return "common/objetTeam";
		}
}
