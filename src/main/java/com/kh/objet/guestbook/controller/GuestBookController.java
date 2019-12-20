package com.kh.objet.guestbook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.guestbook.model.service.GuestBookServiceImpl;

@Controller
public class GuestBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestBookController.class);
	
	@Autowired
	public GuestBookServiceImpl guestbookService;
	
	public GuestBookController() {}
	
	
	// 최민영 **************************************
	// 방명록 리스트 보기
	@RequestMapping("selectArtistGuestBook.do")
	public String selectArtistGuestBook() {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 작성
	@RequestMapping("insertGuestBook.do")
	public String insertGuestBook() {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 수정
	@RequestMapping("updateGuestBook.do")
	public String updateGuestBook() {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 삭제
	@RequestMapping("deleteGuestBook.do")
	public String deleteGuestBook() {
		return "artistHome/artistHomeMain";
	}
	
	// 방명록 검색
	@RequestMapping("selectGuestBook.do")
	public String selectGuestBook() {
		return "artistHome/artistHomeMain";
	}
	
	
	

}
