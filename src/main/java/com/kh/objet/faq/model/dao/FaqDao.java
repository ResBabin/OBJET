package com.kh.objet.faq.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("faqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public FaqDao() {}

}
