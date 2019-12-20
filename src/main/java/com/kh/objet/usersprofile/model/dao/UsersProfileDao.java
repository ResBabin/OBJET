package com.kh.objet.usersprofile.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("usersProfileDao")
public class UsersProfileDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public UsersProfileDao() {}

}
