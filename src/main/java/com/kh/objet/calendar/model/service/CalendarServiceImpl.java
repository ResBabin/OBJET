package com.kh.objet.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.calendar.model.dao.CalendarDao;
import com.kh.objet.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public int insertCalendar() {
		return calendarDao.insertCalendar();
	}
	
	@Override
	public int updateCalendar() {
		return calendarDao.updateCalendar();
	}
	
	@Override
	public int deleteCalendar() {
		return calendarDao.deleteCalendar();
	}
	
	@Override
	public ArrayList<Calendar> selectList(){
		return calendarDao.selectList();
	}
}
