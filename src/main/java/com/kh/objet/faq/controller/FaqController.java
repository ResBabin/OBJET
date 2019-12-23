package com.kh.objet.faq.controller;


import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.faq.model.service.FaqService;
import com.kh.objet.faq.model.vo.Faq;

@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private FaqService faqService;

	public FaqController() {};
	////////////////////////////////////////////////이유진/////////////////////////////////////////////////
	//csmain으로 이동(고객센터 메인)
	@RequestMapping("moveCs.do")
	public String moveCsPage() {
		return "cs/csmain";
	}
    //faqmain으로 이동
	@RequestMapping("moveFaqMain.do")
	public String moveFaqPage() {
		return "cs/faqmain";
	}
	
	//faqmain 전체 목록 불러오기
	@RequestMapping("selectfaqList.do")
		public String selectFaqList() {
		
			return "faq/faqmain";
		}
	

	
		
	
//////////////////////////////////////////////////////관리자//////////////////////////////////////////////////////////////////////
	@RequestMapping("faqm.do")
	public ModelAndView selectFaqList(ModelAndView mv) {
		ArrayList<Faq> faqlist = (ArrayList<Faq>) faqService.selectFaqList();
		mv.addObject("faqlist", faqlist);
		mv.setViewName("admin/FaqManagement");
		return mv;
	}
	
	@RequestMapping("faqmd.do")
	public ModelAndView selectFaqDetail(ModelAndView mv, @RequestParam("faqno") int faqno) {
		Faq faqmd = faqService.selectFaqDetail(faqno);
		ArrayList<Faq> faqlist = (ArrayList<Faq>) faqService.selectFaqList();
		if (faqmd != null) {
			mv.addObject("faqmd", faqmd);
			mv.addObject("faqlist", faqlist);			
			mv.setViewName("admin/FaqManageDetail");
		} else {
			mv.addObject("message", "FAQ 상세 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
}
