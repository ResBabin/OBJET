package com.kh.objet.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("usersDao")
public class UsersDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public UsersDao() {}
}
