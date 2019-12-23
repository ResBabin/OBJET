package com.kh.objet.calendar.model.service;

import java.util.ArrayList;

import com.kh.objet.calendar.model.vo.Calendar;

public interface CalendarService {
	int insertCalendar();
	int updateCalendar();
	int deleteCalendar();
	ArrayList<Calendar> selectList();
}
