package com.kh.objet.calendar.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.calendar.model.service.CalendarServiceImpl;
import com.kh.objet.calendar.model.vo.Calendar;
import com.kh.objet.objet.model.service.ObjetServiceImpl;

@Controller
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarServiceImpl calendarService;
	
	@Autowired
	private ObjetServiceImpl objetServiceImpl;
	
	public CalendarController() {}
	
	// 박근수 ***************************
	
	// 캘린더 리스트 조회
	@RequestMapping("selectCalendar.do")
	public ModelAndView selectCalendar(@RequestParam(value="userid") String userid, ModelAndView mv) {
		ArrayList<Calendar> calList = calendarService.selectList();
		if(calList != null) {
			mv.addObject("calList", calList);
			mv.setViewName("objet/calendar");
		}else {
			mv.addObject("calList", calList);
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 캘린더 등록
	@RequestMapping("insertCalendar.do")
	public String insertCalendar(Calendar calendar, Model model) {
		return "objet/calendar";
	}
	
	// 캘린더 수정
	@RequestMapping("updateCalendar.do")
	public String updateCalendar(Calendar calendar, Model model) {
		return "objet/calendar";
	}
	
	// 캘린더 삭제
	@RequestMapping("deleteCalendar.do")
	public String deleteCalendar(Calendar calendar, Model model) {
		return "objet/calendar";
	}
	
	
}
