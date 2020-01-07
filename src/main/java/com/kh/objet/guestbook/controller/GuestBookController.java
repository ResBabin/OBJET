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
		int listCount = guestbookService.selectGuestBookListCount(artistid);
		paging.makePage(listCount, curPage);
		
				
		// HashMap 객체 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", paging.getStartRow());
		map.put("endRow", paging.getEndRow());
		map.put("artistid", artistid); // 대상 아티스트 아이디
		
		List<GB> list = guestbookService.selectArtistGuestBook(map);
		
		// 작가 닉네임, 한줄소개, 사진 져올 용도
		UAUP artist = usersProfileService.moveArtistHome(artistid);
		
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
		model.addAttribute("kind", "all"); // 출력타입은 전체(all)과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		
		return "artistHome/guestBook";
	}
	
	
	
	
	
	// 내가 쓴 방명록 보기
	@RequestMapping("moveMyGuestBook.do")
	public String selectMyGuestBook(@RequestParam(value="artistid") String artistid, @RequestParam(value="userid") String userid,  @RequestParam("currentPage") String currentPage, Model model) {
		
		//페이징처리 
		int curPage = Integer.valueOf(currentPage);
		// HashMap 객체 생성
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("userid", userid);	// 로그인 아이디
		map1.put("artistid", artistid); // 대상 아티스트 아이디
				
		int listCount = guestbookService.selectMyGuestBookListCount(map1);
		paging.makePage(listCount, curPage);

		// 작가 닉네임, 한줄소개, 사진 져올 용도
		UAUP artist = usersProfileService.moveArtistHome(artistid);
				
		// HashMap 객체 생성
		HashMap<String, Object> map2 = new HashMap<String, Object>();

		map2.put("startRow", paging.getStartRow());
		map2.put("endRow", paging.getEndRow());
		map2.put("artistid", artistid); // 대상 아티스트 아이디
		map2.put("userid", userid); // 로그인 아이디
		
		List<GB> list = guestbookService.selectMyGuestBook(map2);
		
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
		model.addAttribute("kind", "sort"); // 출력타입은 전체(all) 과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
		
		return "artistHome/guestBook";
	}
	
	
	
	// 작가 방명록 검색
		@RequestMapping("moveGuestBookSearch.do")
		public String selectGuestBookSearch(@RequestParam(value="artistid") String artistid, @RequestParam(value="searchtype") String searchtype, @RequestParam(value="keyword") String keyword,  @RequestParam("currentPage") String currentPage, Model model) {
			//페이징처리 
			int curPage = Integer.valueOf(currentPage);
			// HashMap 객체 생성
			HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("artistid", artistid);
				map1.put("searchtype", searchtype);
				map1.put("keyword", keyword);
					
			int listCount = guestbookService.selectGuestBookSearchListCount(map1);
			paging.makePage(listCount, curPage);

			// 작가 닉네임, 한줄소개, 사진 져올 용도
			UAUP artist = usersProfileService.moveArtistHome(artistid);
					
			// HashMap 객체 생성
			HashMap<String, Object> map2 = new HashMap<String, Object>();

			map2.put("startRow", paging.getStartRow());
			map2.put("endRow", paging.getEndRow());
			map2.put("artistid", artistid);
			map2.put("searchtype", searchtype);
			map2.put("keyword", keyword);
			
			List<GB> list = guestbookService.selectGuestBookSearch(map2);
			
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
			model.addAttribute("kind", "search"); // 출력타입은 전체(all) 과 검색(search)과 내가쓴 글(sort)로 나뉘어져있음
			model.addAttribute("searchtype", searchtype);
			model.addAttribute("keyword", keyword);
			
			
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
	@RequestMapping(value="updateGuestBook.do", method=RequestMethod.POST)
	public void updateGuestBook(GuestBook guestbook, Model model, HttpServletResponse response) throws IOException {
		int result = guestbookService.updateGuestBook(guestbook);
		
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
	
	// 방명록 삭제
	@RequestMapping("deleteGuestBook.do")
	public void deleteGuestBook(@RequestParam(value="gbno") int gbno, HttpServletResponse response) throws IOException {
		int result1 = 0, result2 = 0;
		
		// 원글 지우기
		result1 = guestbookService.deleteGuestBook(gbno);
		
		// 댓글도 지우기
		if(result1 > 0) 
			result2 = guestbookService.deleteGuestBookReply(gbno);
		
		
		String returnValue = null;
		
		if(result1 > 0) 
			returnValue = "ok";
		else 
			returnValue = "fail";
		
		PrintWriter out = response.getWriter();
		out.append(returnValue);
		out.flush();
		out.close();
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
				feed.setArtistid(userid);
				feed.setUserid(gbreply.getArtistid());
				
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
		@RequestMapping(value="updateGuestBookReply.do", method=RequestMethod.POST)
		public void updateGuestBookReply(GbReply gbreply, Model model, HttpServletResponse response) throws IOException {
			int result = guestbookService.updateGuestBookReply(gbreply);
			
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
	
	// 방명록 댓글 삭제
		@RequestMapping("deleteGuestBookReply.do")
		public void deleteGuestBookReply(@RequestParam(value="gbno") int gbno, HttpServletResponse response) throws IOException {
			
			int result1 = 0, result2 = 0;
			// 원댓글 삭제
			result1 = guestbookService.deleteGuestBookReply(gbno);
			
			// 삭제 후 원글 댓글 여부 변경
			if(result1 > 0)
				result2 = guestbookService.updateGuestBook2(gbno);
			
			
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
	
	
	

}
