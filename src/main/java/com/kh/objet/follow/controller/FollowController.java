package com.kh.objet.follow.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.feed.model.service.FeedServiceImpl;
import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.follow.model.service.FollowServiceImpl;
import com.kh.objet.follow.model.vo.Follow;
import com.kh.objet.follow.model.vo.Follower;
import com.kh.objet.follow.model.vo.Following;

@Controller
public class FollowController {
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired
	public FollowServiceImpl followService;
	
	@Autowired
	public FeedServiceImpl feedService;
	
	public FollowController() {}
	
	// 최민영 ******************************************
	
	// 팔로잉 보기
		@RequestMapping("moveFollowingPage.do")
		public String moveFollowingPage(@RequestParam(value="artistid") String artistid, @RequestParam(value="loginUserid") String loginUserid, 
										Follow follow, Following following, Model model) {
			
			// 해당 작가의 팔로잉 리스트 가져오기
			List<Follow> followingList = followService.moveFollowingPage(artistid);
			
			// 팔로우 여부를 알기 위해 로그인 유저의 팔로우 리스트 확인
			for(int i = 0 ; i < followingList.size(); i ++) {
				following.setFrom_user(loginUserid);
				following.setTo_user(followingList.get(i).getUserid());
				int result = followService.selectFollowingList(following);
				// 리스트에 있으면
				if(result > 0) 
					if(followingList.get(i).getUserid().equals(loginUserid))
						followingList.get(i).setFollowyn("E");
					else
						followingList.get(i).setFollowyn("Y");
				// 리스트에 없으면
				else
					if(followingList.get(i).getUserid().equals(loginUserid))
						followingList.get(i).setFollowyn("E");
					else
						followingList.get(i).setFollowyn("N");
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
			
			model.addAttribute("followerList", followerList);
			return "artistHome/follower";
		}
	
	// 팔로우하기(ajax)
		@RequestMapping("insertFollowing.do")
		public void insertFollowing(Following following, Follower follower, Feed feed, HttpServletResponse response) throws IOException {
			int result1 = 0, result2 = 0, result3 = 0;
			result1 = followService.insertFollowing(following);
			
			//팔로우 추가 성공 시
			if(result1 > 0) {
				// 팔로워에도 추가
				follower.setFrom_user(following.getFrom_user());
				follower.setTo_user(following.getTo_user());
				result2 = followService.insertFollower(follower);
				
				// 팔로잉 피드 알림 보내기
				if(result2 > 0) {
					feed.setArtistid(following.getTo_user());
					feed.setUserid(following.getFrom_user());
					String nickname = followService.getNickname(following.getFrom_user());
					feed.setFeedcontent(nickname + "님이 회원님을 관심작가로 추가하였습니다.");
					result3 = feedService.insertFeed(feed);
				}
			}
			String returnValue = null;
			if(result1 > 0 && result2 > 0 && result3 > 0) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
			
		}
	
	// 구독취소 하기
		@RequestMapping("deleteFollowing.do")
		public void deleteFollowing(Following following, Follower follower, HttpServletResponse response) throws IOException {
			int result1, result2 = 0;
			result1 = followService.deleteFollowing(following);
			
			//구독취소 성공 시
			if(result1 > 0) {
				// 팔로워에서도 삭제
				follower.setFrom_user(following.getFrom_user());
				follower.setTo_user(following.getTo_user());
				result2 = followService.deleteFollower(follower);
			}
			String returnValue = null;
			if(result1 > 0 && result2 > 0) 
				returnValue = "ok";
			else
				returnValue = "fail";
			
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
			
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
