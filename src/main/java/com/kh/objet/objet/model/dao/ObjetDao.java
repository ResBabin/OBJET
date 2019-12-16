package com.kh.objet.objet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("objetDao")
public class ObjetDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public ObjetDao() {}
}
