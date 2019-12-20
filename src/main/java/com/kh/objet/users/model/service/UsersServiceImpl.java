package com.kh.objet.users.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.users.model.dao.UsersDao;
import com.kh.objet.users.model.vo.Users;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao usersDao;
	
	
	@Override
	public int insertUsers(Users users) {
		return usersDao.insertUsers(users);
	}

	@Override
	public Users selectUsersLogin(Users users) {
		return usersDao.selectUsersLogin(users);
	}


	
}
