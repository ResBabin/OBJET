package com.kh.objet.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.faq.controller.FaqController;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	public NoticeController() {}
	
	
		@RequestMapping("Movenotice.do")
		public String MoveNoticePage() {
			return "notice/noticemain";
		}
		//공지사항 디테일
		@RequestMapping("Movenoticedetail.do")
		public String MoveNoticeDetailPage() {
			return "notice/noticeDetail";
		}

}
