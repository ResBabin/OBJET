package com.kh.objet.visitedobjet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("visitedObjetDao")
public class VisitedObjetDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public VisitedObjetDao() {}

}
