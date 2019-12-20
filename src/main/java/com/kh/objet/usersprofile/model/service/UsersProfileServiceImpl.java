package com.kh.objet.usersprofile.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.usersprofile.model.dao.UsersProfileDao;

@Service("usersProfileService")
public class UsersProfileServiceImpl implements UsersProfileService{

	@Autowired
	private UsersProfileDao usersProfileDao;
}
