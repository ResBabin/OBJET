package com.kh.objet.users.model.service;

import com.kh.objet.users.model.vo.Users;

public interface UsersService {
	
	public int insertUsers(Users users);
	
	public Users selectUsersLogin(Users users);
	

}
