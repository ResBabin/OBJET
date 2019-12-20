package com.kh.objet.gbreply.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("gbReplyDao")
public class GbReplyDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public GbReplyDao() {}

}
