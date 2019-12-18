package com.kh.objet.notice.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.faq.controller.FaqController;
import com.kh.objet.notice.model.service.NoticeService;
import com.kh.objet.notice.model.vo.Notice;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}

	@RequestMapping("Movenotice.do")
	public String MoveNoticePage() {
		return "notice/noticemain";
	}

	// 공지사항 디테일
	@RequestMapping("Movenoticedetail.do")
	public String MoveNoticeDetailPage() {
		return "notice/noticeDetail";
	}

	@RequestMapping("noticem.do")
	public ModelAndView noticeListM(ModelAndView mv) {
		ArrayList<Notice> noticelist = (ArrayList<Notice>) noticeService.selectNoticeList();
		mv.addObject("noticelist", noticelist);
		mv.setViewName("admin/noticeManagement");
		return mv;
	}

	@RequestMapping("noticemd.do")
	public ModelAndView noticeDetailM(ModelAndView mv, @RequestParam("noticeno") int noticeno) {
		Notice noticemd = noticeService.selectNoticeDetail(noticeno);
		ArrayList<Notice> noticelist = (ArrayList<Notice>) noticeService.selectNoticeList();
		if (noticemd != null) {
			mv.addObject("noticemd", noticemd);
			mv.addObject("noticelist", noticelist);			
			mv.setViewName("admin/noticeManageDetail");
		} else {
			mv.addObject("message", "공지 상세 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;

	}
}
