package com.kh.objet.qna.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.qna.model.service.QnaServiceImpl;
import com.kh.objet.qna.model.vo.Qna;

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
			return "user/myQnaList";
		}
		
		
		

		////////////////////////////////////이유진///////////////////////////////////////////////
	
		//문의내역 전체보기
	     @RequestMapping("selectQnaList.do")
	     public String selectQnaList() {
	    	 return "user/myQnaList";
	     }
	     
	   //공지사항 상세보기
	     @RequestMapping("selectQnaDetail.do")
	     public String selectQnaDetail() {
	    	 return "user/myQnaDetail";
	     }
		
		//문의하기 글쓰기
		@RequestMapping("insertWriteQna.do")
		public String insertWriteQna() {
				return"cs/csmain";
		}
		//문의내역 수정하기
		@RequestMapping("updateWriteQna.do")
		public String updateWriteQna() {
			return"user/myQnaList";
		}
		//문의내역 삭제하기
		@RequestMapping("deleteWriteQna.do")
		public String deleteWriteQna() {
			return "user/myQnaList";
		}
		
	// 김은솔 ***************************************************	
  
  
	// 문의내역 삭제
		@RequestMapping("deleteMyQna.do")
		public String deleteMyQna() {
			return "user/myQnaList";
		}	
		
	// 문의내역 검색
		@RequestMapping("selectMyQnaSearch.do")
		public String selectMyQnaSearch() {
			return "user/myQnaList";
		}	
  
  // 관리자 Qna 컨트롤러
 		@RequestMapping("qnam.do")
		public ModelAndView selectQnaListAdmin(ModelAndView mv){
			ArrayList<Qna> qnalist = (ArrayList<Qna>) qnaService.selectQnaListAdmin();
			mv.addObject("qnalist", qnalist);
			mv.setViewName("admin/QnaManagement");
			return mv;
		} 
		
		@RequestMapping("qnamd.do")
		public ModelAndView selectQnaDetailAdmin(ModelAndView mv, @RequestParam("qnano") int qnano) {
			Qna qnamd = qnaService.selectQnaDetailAdmin(qnano);
			ArrayList<Qna> qnalist = (ArrayList<Qna>) qnaService.selectQnaListAdmin();
			if (qnamd != null) {
				mv.addObject("qnamd", qnamd);
				mv.addObject("qnalist", qnalist);			
				mv.setViewName("admin/QnaManageDetail");
			} else {
				mv.addObject("message", "QnA 상세 조회 실패");
				mv.setViewName("common/error");
			}
			return mv;
		}
}
