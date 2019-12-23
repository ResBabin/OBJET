package com.kh.objet.guestbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.guestbook.model.service.GuestBookServiceImpl;
import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.paging.model.vo.Paging;

@Controller
public class GuestBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestBookController.class);
	
	@Autowired
	public GuestBookServiceImpl guestbookService;
	
	public GuestBookController() {}
	
	
	// 최민영 **************************************
	// 방명록 리스트 보기
	@RequestMapping({"selectArtistGuestBook.do", "artistHomeMain.do"})
	public String selectArtistGuestBook(@RequestParam(value="userid") String userid, Paging paging) {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 작성
	@RequestMapping("insertGuestBook.do")
	public String insertGuestBook(GuestBook guestbook, Model model) {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 수정
	@RequestMapping("updateGuestBook.do")
	public String updateGuestBook(@RequestParam(value="gbno") int gbno, Model model) {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 삭제
	@RequestMapping("deleteGuestBook.do")
	public String deleteGuestBook(@RequestParam(value="gbno") int gbno, Model model) {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 검색
	@RequestMapping("selectGuestBook.do")
	public String selectGuestBookSearch(@RequestParam(value="userid") String userid, @RequestParam(value="gbcontent") String gbcontent, Paging paging) {
		return "artistHome/artistHomeMain";
	}
	
	
	// 방명록 댓글 부분 *******************************
	// 방명록 댓글 작성
		@RequestMapping("insertGuestBookReply.do")
		public String insertGuestBookReply(@RequestParam(value="gbno") int gbno, GbReply gbreply) {
			return "artistHome/artistHomeMain";
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
