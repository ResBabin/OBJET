package com.kh.objet.following.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("followingDao")
public class FollowingDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public FollowingDao() {}

}
