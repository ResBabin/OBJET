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
	public int insertCalendar(Calendar calendar) {
		return calendarDao.insertCalendar(calendar);
	}
	
	@Override
	public int updateCalendar(Calendar calendar) {
		return calendarDao.updateCalendar(calendar);
	}
	
	@Override
	public int deleteCalendar(Calendar calendar) {
		return calendarDao.deleteCalendar(calendar);
	}
	
	@Override
	public ArrayList<Calendar> selectList(){
		return calendarDao.selectList();
	}
}
