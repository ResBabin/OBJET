package com.kh.objet.calendar.model.service;

import java.util.ArrayList;

import com.kh.objet.calendar.model.vo.Calendar;

public interface CalendarService {
	int insertCalendar(Calendar calendar);
	int updateCalendar(Calendar calendar);
	int deleteCalendar(Calendar calendar);
	ArrayList<Calendar> selectList();
}
