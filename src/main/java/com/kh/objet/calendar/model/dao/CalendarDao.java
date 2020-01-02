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
	
	public int insertCalendar(Calendar calendar) {
		return mybatisSession.insert("calendarMapper.insertCalendar", calendar);
	}

	public int updateCalendar(Calendar calendar) {
		return mybatisSession.update("calendarMapper.updateCalendar", calendar);
	}

	public int deleteCalendar(Calendar calendar) {
		return mybatisSession.delete("calendarMapper.deleteCalendar", calendar);
	}

	public ArrayList<Calendar> selectList() {
		List<Calendar> list = mybatisSession.selectList("calendarMapper.selectList");
		return (ArrayList<Calendar>)list;
	}

}
