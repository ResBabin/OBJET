package com.kh.objet.usersprofile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.follow.model.service.FollowServiceImpl;
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
		public String moveArtistHome(@RequestParam(value="userid") String userid, Model model) {
			String vfn = "artistHome/artistHomeMain";
			UAUP usersProfile = usersProfileService.moveArtistHome(userid);
			
			int follower = followService.FollowerGetListCount(userid);
			int following = followService.FollowingGetListCount(userid);
			
			model.addAttribute("usersProfile", usersProfile);
			model.addAttribute("follower", follower);
			model.addAttribute("following", following);
			
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
		public String moveArtistIntroEdit(@RequestParam(value="userid") String userid) {
			return "artistHome/artistIntroEdit";
		}
	
	// 작가소개수정
		@RequestMapping("updateArtistIntro.do")
		public String updateArtistIntro(UsersProfile usersprofile) {
			return "artistHome/artistHomeMain";
		}

}
