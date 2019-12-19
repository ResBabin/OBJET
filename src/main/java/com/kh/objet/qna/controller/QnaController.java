package com.kh.objet.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.qna.model.service.QnaServiceImpl;

@Controller
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaServiceImpl qnaService;
	
	public QnaController() {}
	
	
	// 최민영 ****************************************************************************************
	// 문의내역 페이지 이동
		@RequestMapping("moveMyQnaList.do")
		public String moveMyQnaList() {
			return "user/myQnaList";
		}
	
	// 문의내역 상세보기 페이지 이동
		@RequestMapping("moveMyQnaDetail.do")
		public String moveMyQnaDetail() {
			return "user/myQnaDetail";
		}
		
	// 문의내역 수정 페이지 이동
		@RequestMapping("moveMyQnaEdit.do")
		public String moveMyQnaEdit() {
			return "user/myQnaEdit";
		}
		
	// 문의내역 등록 페이지 이동
		@RequestMapping("moveMyQnaWrite.do")
		public String moveMyQnaWrite() {
			return "user/myQnaWrite";
		}
}
