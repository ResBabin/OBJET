package com.kh.objet.usersprofile.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.usersprofile.model.vo.UsersProfile;

@Repository("usersProfileDao")
public class UsersProfileDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public UsersProfileDao() {}

	// 최민영 *********************************
	// 작가홈 이동
	public UAUP moveArtistHome(String userid) {
		return mybatisSession.selectOne("userMapper.moveArtistHome", userid);
	}

	// 작가소개수정 이동
	public UsersProfile moveArtistIntroEdit(String userid) {
		return mybatisSession.selectOne("", userid);
	}

	// 작가소개  수정
	public int updateArtistIntro(UsersProfile usersprofile) {
		return mybatisSession.update("", usersprofile);
	}

}
