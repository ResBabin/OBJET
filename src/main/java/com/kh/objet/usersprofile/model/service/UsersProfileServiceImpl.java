package com.kh.objet.usersprofile.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.usersprofile.model.dao.UsersProfileDao;
import com.kh.objet.usersprofile.model.vo.UsersProfile;

@Service("usersProfileService")
public class UsersProfileServiceImpl implements UsersProfileService{

	@Autowired
	private UsersProfileDao usersProfileDao;

	
	// 최민영 *********************************
	// 작가홈 이동
	@Override
	public UAUP moveArtistHome(String userid) {
		return usersProfileDao.moveArtistHome(userid);
	}

	// 작가소개수정 이동
	@Override
	public UsersProfile moveArtistIntroEdit(String userid) {
		return usersProfileDao.moveArtistIntroEdit(userid);
	}

	// 작가소개  수정
	@Override
	public int updateArtistIntro(UsersProfile usersprofile) {
		return usersProfileDao.updateArtistIntro(usersprofile);
	}

}
