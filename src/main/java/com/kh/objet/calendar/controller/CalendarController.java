package com.kh.objet.calendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.objet.calendar.model.service.CalendarServiceImpl;
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
	
	// 캘린더 조회
	@RequestMapping("selectCalendar.do")
	public String selectCalendar(@RequestParam(value="userid") String userid, Model model) {
		return "objet/calendar";
	}
	
}
