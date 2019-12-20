package com.kh.objet.likeobjet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("likeObjetDao")
public class LikeObjetDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public LikeObjetDao() {}

}
