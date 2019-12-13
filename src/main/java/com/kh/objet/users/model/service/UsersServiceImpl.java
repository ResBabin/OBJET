package com.kh.objet.users.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.users.model.dao.UsersDao;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao userDao;
}
