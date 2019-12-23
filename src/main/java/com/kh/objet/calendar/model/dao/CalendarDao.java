package com.kh.objet.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.calendar.model.vo.Calendar;

@Repository("CalendarDao")
public class CalendarDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public int insertCalendar() {
		return mybatisSession.insert("calendarMapper.insertCalendar");
	}

	public int updateCalendar() {
		return mybatisSession.update("calendarMapper.updateCalendar");
	}

	public int deleteCalendar() {
		return mybatisSession.delete("calendarMapper.deleteCalendar");
	}

	public ArrayList<Calendar> selectList() {
		List<Calendar> list = mybatisSession.selectList("calendarMapper.selectList");
		return (ArrayList<Calendar>)list;
	}

}
