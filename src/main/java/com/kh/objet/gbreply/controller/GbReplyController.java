package com.kh.objet.gbreply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.gbreply.model.service.GbReplyServiceImpl;

@Controller
public class GbReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(GbReplyController.class);
	
	@Autowired
	public GbReplyServiceImpl gbReplyService;
	
	public GbReplyController() {}

	
	// 최민영 *******************************************
	// 방명록 댓글 작성
		@RequestMapping("insertGuestBookReply.do")
		public String insertGuestBookReply() {
			return "artistHome/artistHomeMain";
		}
	
	// 방명록 댓글 수정
		@RequestMapping("updateGuestBookReply.do")
		public String updateGuestBookReply() {
			return "artistHome/artistHomeMain";
		}
	
	// 방명록 댓글 삭제
		@RequestMapping("deleteGuestBookReply.do")
		public String deleteGuestBookReply() {
			return "artistHome/artistHomeMain";
		}
}
