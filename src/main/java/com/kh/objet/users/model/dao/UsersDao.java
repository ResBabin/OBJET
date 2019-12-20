package com.kh.objet.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.users.model.vo.Users;

@Repository("usersDao")
public class UsersDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public UsersDao() {}
	
	public int insertUsers(Users users) {
		return mybatisSession.insert("", users);
	}

	public Users selectUsersLogin(Users users) {
		return mybatisSession.selectOne("", users);
	}


}
