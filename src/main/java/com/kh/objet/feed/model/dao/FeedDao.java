package com.kh.objet.feed.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("feedDao")
public class FeedDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public FeedDao() {}
}
