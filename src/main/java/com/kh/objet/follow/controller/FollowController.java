package com.kh.objet.follow.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.follow.model.service.FollowServiceImpl;
import com.kh.objet.follow.model.vo.Follow;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;

@Controller
public class FollowController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired
	public FollowServiceImpl followService;
	
	public FollowController() {}
	
	// 최민영 ******************************************
	
	// 팔로잉 보기
		@RequestMapping("moveFollowingPage.do")
		public String moveFollowingPage(@RequestParam(value="artistid") String artistid, @RequestParam(value="loginUserid") String loginUserid, Follower follower, Model model) {
			
			List<Following> followingList = followService.moveFollowingPage(artistid);
			for(int i = 0 ; i < followingList.size(); i ++) {
				
			}
			
			model.addAttribute("followingList", followingList);
			return "artistHome/following";
		}
	
		
	// 팔로워 보기
		@RequestMapping("moveFollowerPage.do")
		public String moveFollowerPage(@RequestParam(value="artistid") String artistid, @RequestParam(value="loginUserid") String loginUserid, Follow follow, Following following, Model model) {
			
			// 해당 작가의 팔로워 리스트 가져오기
			List<Follow> followerList = followService.moveFollowerPage(artistid);
			
			// 팔로우 여부를 알기 위해 로그인 유저의 팔로우 리스트 확인
			for(int i = 0 ; i < followerList.size() ; i++) {
				following.setFrom_user(loginUserid);
				following.setTo_user(followerList.get(i).getUserid());
				int result = followService.selectFollowingList(following);
				// 리스트에 있으면
				if(result > 0) 
					if(followerList.get(i).getUserid().equals(loginUserid))
						followerList.get(i).setFollowyn("E");
					else
					followerList.get(i).setFollowyn("Y");
				// 리스트에 없으면
				else
					if(followerList.get(i).getUserid().equals(loginUserid))
						followerList.get(i).setFollowyn("E");
					else
					followerList.get(i).setFollowyn("N");
			}
			
			System.out.println(followerList.toString());
			model.addAttribute("followerList", followerList);
			return "artistHome/follower";
		}
	
	// 팔로우하기(ajax)
		@RequestMapping("insertFollowing.do")
		public void insertFollowing(Following following) {
		}
	
	// 언팔로잉 하기
		@RequestMapping("deleteFollowing.do")
		public void deleteFollowing(Following following) {
		}

/*	
	// 팔로워 추가
		@RequestMapping("insertFollower.do")
		public void insertFollower(Follower follower) {
			
		}
		
	// 팔로워 삭제
		@RequestMapping("deleteFollower.do")
		public void deleteFollower(Follower follower) {
		}
*/	

	
}
