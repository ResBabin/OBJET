package com.kh.objet.usersprofile.model.service;

import com.kh.objet.usersprofile.model.vo.UsersProfile;

public interface UsersProfileService {
	
	// 최민영 ******************************
	UsersProfile moveArtistHome(String userid);
	UsersProfile moveArtistIntroEdit(String userid);
	int updateArtistIntro(UsersProfile usersprofile);
	

}
