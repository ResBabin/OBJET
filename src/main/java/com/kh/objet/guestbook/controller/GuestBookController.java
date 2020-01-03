package com.kh.objet.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.feed.model.service.FeedServiceImpl;
import com.kh.objet.feed.model.vo.Feed;
import com.kh.objet.guestbook.model.service.GuestBookServiceImpl;
import com.kh.objet.guestbook.model.vo.GB;
import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.usersprofile.model.service.UsersProfileServiceImpl;

@Controller
public class GuestBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestBookController.class);
	
	@Autowired
	public GuestBookServiceImpl guestbookService;
	
	@Autowired
	private UsersProfileServiceImpl usersProfileService;
	
	@Autowired
	public FeedServiceImpl feedService;
	
	@Autowired
	private Paging paging;
	
	public GuestBookController() {}
	
	
	// 최민영 **************************************
	
	
	// 방명록 리스트 보기
	@RequestMapping("moveArtistGuestBook.do")
	public String selectArtistGuestBook(@RequestParam(value="artistid") String artistid, @RequestParam(value="userid") String userid,  @RequestParam("currentPage") String currentPage, Model model) {
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		int listCount = guestbookService.getGuestBookListCount(artistid);
		String kind = "all";
		paging.makePage(listCount, curPage);

		// 작가 닉네임, 한줄소개, 사진 져올 용도
		UAUP artist = usersProfileService.moveArtistHome(artistid);
				
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("artistid", artistid); // 대상 아티스트 아이디
		
		List<GB> list = guestbookService.selectArtistGuestBook(map);
		
		for (GB gb : list) {
			UAUP user = usersProfileService.moveArtistHome(gb.getUserid());
			gb.setArtistid(artist.getUserid());
			gb.setArtistnickname(artist.getNickname());
			gb.setUsernickname(user.getNickname());
			gb.setUserrpic(user.getUserrpic());
		}
		
		
		
		model.addAttribute("artist", artist);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("type", "all"); // 출력타입은 전체(all) 과 검색(search)로 나뉘어져있음
		
		return "artistHome/guestBook";
	}
	
	
	// 방명록 작성
	@RequestMapping(value="insertGuestBook.do", method=RequestMethod.POST)
	public void insertGuestBook(GuestBook guestbook, Model model, HttpServletResponse response) throws IOException {
		int result1 = 0, result2 = 0;
		
		if(guestbook.getPrivateyn() == null) {
			guestbook.setPrivateyn("N");
		}
		
		result1 = guestbookService.insertGuestBook(guestbook);
		
		if(result1 > 0) {
			// 피드에 알림 넣기
			Feed feed = new Feed();
			feed.setArtistid(guestbook.getArtistid());
			feed.setUserid(guestbook.getUserid());
			
			UAUP user = usersProfileService.moveArtistHome(guestbook.getUserid());
			feed.setFeedcontent(user.getNickname() + " 님이 방명록을 남겼습니다.");
			
			result2 = feedService.insertFeed(feed);
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
	
	// 방명록 비밀로하기
	@RequestMapping("updateGuestBookPrivate.do")
	public void updateGuestBookPrivate(@RequestParam(value="gbno") int gbno, @RequestParam(value="privateyn") String privateyn, HttpServletResponse response) throws IOException {
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("gbno", gbno);
		map.put("privateyn", privateyn);
		
		int result = guestbookService.updateGuestBookPrivate(map);
		
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
	
	// 방명록 수정
	@RequestMapping("updateGuestBook.do")
	public String updateGuestBook(@RequestParam(value="gbno") int gbno, Model model) {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 삭제
	@RequestMapping("deleteGuestBook.do")
	public void deleteGuestBook(@RequestParam(value="gbno") int gbno, HttpServletResponse response) throws IOException {
		int result = guestbookService.deleteGuestBook(gbno);
		
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
	
	// 방명록 검색
	@RequestMapping("selectGuestBook.do")
	public String selectGuestBookSearch(@RequestParam(value="userid") String userid, @RequestParam(value="gbcontent") String gbcontent, Paging paging) {
		return "artistHome/artistHomeMain";
	}
	
	
	// 방명록 댓글 부분 *******************************
	// 방명록 댓글 작성
		@RequestMapping("insertGuestBookReply.do")
		public void insertGuestBookReply(GbReply gbreply, @RequestParam(value="userid") String userid, HttpServletResponse response) throws IOException {
			int result1 = 0 , result2 = 0, result3 = 0;
			result1 = guestbookService.insertGuestBookReply(gbreply);
			if(result1 > 0) {
				// 댓글 여부 업데이트
				result2 = guestbookService.updateReplyyn(gbreply.getGbno());
			}
			
			if(result2 > 0) {
				// 피드알림
				Feed feed = new Feed();
				feed.setArtistid(gbreply.getArtistid());
				feed.setUserid(userid);
				
				UAUP user = usersProfileService.moveArtistHome(gbreply.getArtistid());
				feed.setFeedcontent(user.getNickname() + " 님이 방명록에 댓글을 남겼습니다.");
				
				result3 = feedService.insertFeed(feed);
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
	
	// 방명록 댓글 수정
		@RequestMapping("updateGuestBookReply.do")
		public String updateGuestBookReply(@RequestParam(value="gbno") int gbno, GbReply gbreply) {
			return "artistHome/artistHomeMain";
		}
	
	// 방명록 댓글 삭제
		@RequestMapping("deleteGuestBookReply.do")
		public String deleteGuestBookReply(@RequestParam(value="gbno") int gbno) {
			return "artistHome/artistHomeMain";
		}
	
	
	

}
