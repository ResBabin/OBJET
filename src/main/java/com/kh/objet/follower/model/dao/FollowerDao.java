package com.kh.objet.follower.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("followerDao")
public class FollowerDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public FollowerDao() {};

}
