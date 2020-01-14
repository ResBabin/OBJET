                                                                                                                                                                                                                                                                                                                                                  package com.kh.objet.usersprofile.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.objet.follow.model.service.FollowServiceImpl;
import com.kh.objet.follow.model.vo.Following;
import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.usersprofile.model.service.UsersProfileServiceImpl;
import com.kh.objet.usersprofile.model.vo.UsersProfile;

@Controller
public class UsersProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(UsersProfileController.class);
	
	@Autowired
	private UsersProfileServiceImpl usersProfileService;
	
	@Autowired
	private FollowServiceImpl followService;

	
	public UsersProfileController() {}
	
	// 최민영 *********************************************
	
	
	// 작가홈 이동
		@RequestMapping(value="artistHomeMain.do", method=RequestMethod.GET)
		public String moveArtistHome(@RequestParam(value="userid") String userid, @RequestParam(value="loginUser") String loginUser, Following following2, Model model) {
			String vfn = "artistHome/artistHomeMain";
			UAUP usersProfile = usersProfileService.moveArtistHome(userid);
			
			int follower = followService.FollowerGetListCount(userid);
			int following = followService.FollowingGetListCount(userid);
			
			// 구독 여부 확인용
			String followyn = null;
			following2.setFrom_user(loginUser);
			following2.setTo_user(userid);
			int result = followService.selectFollowingList(following2);
			// 구독중이라면
			if(result > 0) 
				followyn = "Y";
			// 아니라면
			else
				followyn = "N";
			
			
			model.addAttribute("usersProfile", usersProfile);
			model.addAttribute("follower", follower);
			model.addAttribute("following", following);
			model.addAttribute("followyn", followyn);
			
			if(usersProfile == null) {
				vfn = "common/error";
				model.addAttribute("message", "작가홈 프로필 로딩 실패!");
			} else if ( follower < 0 || following < 0) {
				vfn = "common/error";
				model.addAttribute("message", "팔로우, 팔로워 로딩 실패!");
			}
			
			return vfn;
		}
		
		
	
	// 작가소개수정 이동
		@RequestMapping("moveArtistIntroEdit.do")
		public String moveArtistIntroEdit(@RequestParam(value="userid") String userid, Model model) {
			UAUP usersProfile = usersProfileService.moveArtistHome(userid);
			
			String vfn = null;
			if(usersProfile != null) {
				model.addAttribute("usersProfile", usersProfile);
				vfn = "artistHome/artistIntroEdit";
			} else {
				model.addAttribute("message", "작가홈 로딩 실패!");
				vfn = "common/error";
			}
			return vfn;
		}
	
	// 작가소개수정
		@RequestMapping(value="updateArtistIntro.do", method=RequestMethod.POST)
		public String updateArtistIntro(UsersProfile usersprofile, HttpServletRequest request, @RequestParam(value="up_useropic", required=false) MultipartFile file, Model model) {
			String vfn = null;
			
			// 태그 체크된 것 ,로 묶어서 한줄로 DB에 저장하기
			if(usersprofile.getUsertag() != null) {
				usersprofile.setUsertag(String.join(",", usersprofile.getUsertag()));
			}
			
			/*
			// textarea 엔터 키 <br>로 바꿔서 DB저장하기
			if(usersprofile.getUserintrol() != null) {
				usersprofile.setUserintrol(usersprofile.getUserintrol().replace("\n", "<br>"));
			}
			if(usersprofile.getPortfolio() != null) {
				usersprofile.setPortfolio(usersprofile.getPortfolio().replace("\n", "<br>"));
			}
			*/
			String savePath = request.getSession().getServletContext().getRealPath("resources/users_upfiles");
			
			try {
				if(file != null && file.getOriginalFilename() != "") {
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
					file.transferTo(new File(savePath + "\\" + renameFileName));
					usersprofile.setUseropic(file.getOriginalFilename());
					usersprofile.setUserrpic(renameFileName);
				}else {
					if(usersprofile.getUseropic() != null && usersprofile.getUserrpic() != null) {
						usersprofile.setUseropic(usersprofile.getUseropic());
						usersprofile.setUserrpic(usersprofile.getUserrpic());
					}
				}
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			
			int result = usersProfileService.updateArtistIntro(usersprofile);
			
			if(result > 0) {
				vfn = "redirect:artistHomeMain.do?userid="+usersprofile.getUserid()+"&loginUser="+usersprofile.getUserid();
			}else {
				vfn = "common/error";
				model.addAttribute("message", "작가소개수정 실패!");
			}
			
			return vfn;
		}
		
		
		@RequestMapping("moveVRView.do")
		public String moveVRView() {
			return "objet/objetVRView";
		}

}
