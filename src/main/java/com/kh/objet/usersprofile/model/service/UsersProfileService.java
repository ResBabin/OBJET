package com.kh.objet.usersprofile.model.service;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.usersprofile.model.vo.UsersProfile;

public interface UsersProfileService {
	
	// 최민영 ******************************
	UAUP moveArtistHome(String userid);
	UsersProfile moveArtistIntroEdit(String userid);
	int updateArtistIntro(UsersProfile usersprofile);
	Objet selectObjetColor(String userid);
	

}
