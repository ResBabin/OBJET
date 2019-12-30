package com.kh.objet.feed.controller;

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

@Controller
public class FeedController {
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired
	public FeedServiceImpl feedService;
	
	public FeedController() {}
	
	// 최민영 *****************************************************
	// 피드알림 페이지 이동
		@RequestMapping("moveFeedList.do")
		public String moveFeedList(@RequestParam(value="artistid") String artistid, Model model) {
			List<Feed> feedlist = feedService.moveFeedList(artistid);
			model.addAttribute("feedlist", feedlist);
			return "user/feedList";
		}
		
	// 피드알림 삭제
		@RequestMapping("deleteFeed.do")
		public void deleteFeed(@RequestParam(value="feedno") int feedno, HttpServletResponse response) throws IOException {
			int result = feedService.deleteFeed(feedno);
			
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

}
