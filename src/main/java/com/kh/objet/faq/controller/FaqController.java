package com.kh.objet.faq.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.faq.model.service.FaqService;
import com.kh.objet.faq.model.vo.Faq;
import com.kh.objet.notice.model.service.NoticeService;
import com.kh.objet.notice.model.vo.Notice;

@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private FaqService faqService;
	@Autowired //각각 따로 해주기
	private NoticeService noticeService;

	public FaqController() {};
	////////////////////////////////////////////////이유진/////////////////////////////////////////////////
	//csmain으로 이동(고객센터 메인)
	@RequestMapping("moveCs.do")
	public String moveCsPage(Model model) {
		List<Faq>list = faqService.selectFaqList();
		List<Notice>nlist = noticeService.selectNoticeType();   //일반
		List<Notice>blist = noticeService.selectNoticeType1();  //전시
		List<Notice>clist = noticeService.selectNoticeType2();  //회원
		List<Notice>dlist = noticeService.selectNoticeType3();  //전체
		model.addAttribute("nlist",nlist);
		model.addAttribute("nlist",dlist);
		model.addAttribute("blist",blist);
		model.addAttribute("clist",clist);
		model.addAttribute("list",list);
		return "cs/csmain";
	}
	
	@RequestMapping("movePr.do")
	public String movePr(Model model) {
       return "cs/pr";
	}
 	
	//faqmain 전체 목록 불러오기
	@RequestMapping("selectFaqList.do")
		public String selectFaqList(Model model) {
		List<Faq>list = faqService.selectFaqList();
		model.addAttribute("list",list);
   	      return "cs/faqmain";
		}
	//faqmain 전체 목록 불러오기
	//고객센터 메인으로 보냄
		/*@RequestMapping("selectCsMainFaq.do")
			public String selectCsMainFaq(Model model) {
			List<Faq>list = faqService.selectFaqList();
			model.addAttribute("list",list);
	   	      return "cs/csmain";
			}
	*/

	
		
	
//////////////////////////////////////////////////////관리자//////////////////////////////////////////////////////////////////////
@RequestMapping("faqm.do")
public ModelAndView selectFaqList(ModelAndView mv, HttpServletRequest request) {

Map<String, Integer> map = new HashMap<>();

int currentPage = 1;
if(request.getParameter("page") != null) {
currentPage = Integer.parseInt(request.getParameter("page"));
}
int limit = 10;  //한 페이지에 출력할 목록 갯수
int listCount = faqService.selectFaqCountAd();  //테이블의 전체 목록 갯수 조회
//총 페이지 수 계산
int maxPage = listCount / limit;
if(listCount % limit > 0)
maxPage++;

//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
int beginPage = (currentPage / limit) * limit + 1;
if(currentPage % limit == 0) {
beginPage -= limit;
}
int endPage = beginPage + 9;
if(endPage > maxPage)
endPage = maxPage;

//currentPage 에 출력할 목록의 조회할 행 번호 계산
int startRow = (currentPage * limit) - 9;
int endRow = currentPage * limit;
map.put("startRow", startRow);
map.put("endRow", endRow);

ArrayList<Faq> faqlist = (ArrayList<Faq>) faqService.selectFaqListAd(map);
mv.addObject("faqlist", faqlist);
mv.addObject("currentPage", currentPage);
mv.addObject("listCount", listCount);
mv.addObject("maxPage", maxPage);
mv.addObject("beginPage", beginPage);
mv.addObject("endPage", endPage);
mv.setViewName("admin/FaqManagement");
return mv;
}

@RequestMapping("faqmd.do")
public ModelAndView selectFaqDetail(ModelAndView mv, @RequestParam("faqno") int faqno) {
Faq faqmd = faqService.selectFaqDetail(faqno);

if (faqmd != null) {
mv.addObject("faqmd", faqmd);
mv.setViewName("admin/FaqManageDetail");
} else {
mv.addObject("message", "FAQ 상세 조회 실패");
mv.setViewName("common/error");
}
return mv;
}

}
