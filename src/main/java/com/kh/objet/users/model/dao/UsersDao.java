package com.kh.objet.users.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.quit.model.vo.Quit;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.users.model.vo.Users;

@Repository("usersDao")
public class UsersDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public UsersDao() {}
	
	//최민영 ***********************************
	// 아이디 중복체크
	public int selectCheckId(String userid) {
		return mybatisSession.selectOne("userMapper.selectCheckId", userid);
	}
	
	// 닉네임 중복체크
	public int selectCheckNickname(String nickname) {
		return mybatisSession.selectOne("userMapper.selectCheckNickname", nickname);
	}
	
	// 회원가입
	public int insertUsers(Users users) {
		return mybatisSession.insert("userMapper.insertUsers", users);
	}
	
	// 회원가입시 usersprofile 추가
	public int insertUsersProfile(String userid) {
		return mybatisSession.insert("userMapper.insertUsersProfile", userid);
	}

	// 회원 로그인
	public UAUP selectUsersLogin(UAUP users) {
		return mybatisSession.selectOne("userMapper.selectUsersLogin", users);
	}

	// 아이디찾기
	public ArrayList<Users> selectFindId(Users users) {
		List<Users> list = mybatisSession.selectList("userMapper.selectFindId",users);
		return (ArrayList<Users>) list;
	}

	// 비밀번호 찾기
	public Users selectFindPwd(Users users) {
		return mybatisSession.selectOne("userMapper.selectFindPwd",users);
	}
	
	// 임시비밀번호 수정
	public int updateUserPwd(Users users) {
		return mybatisSession.update("userMapper.updateUserPwd", users);
	}

	// 내정보 수정 페이지 이동
	public Users moveMyPageEdit(String userid) {
		return mybatisSession.selectOne("userMapper.moveMyPageEdit", userid);
	}

	// 내정보 수정
	public int updateMyPage(Users users) {
		return mybatisSession.update("", users);
	}

	// 회원탈퇴1
	public int updateQuitUser(String userid) {
		return mybatisSession.update("", userid);
	}
	
	// 회원탈퇴2
	public int insertQuitUser(Quit quit) {
		return mybatisSession.insert("", quit);
	}

	// 작가 신고하기
	public int insertUsersReport(ReportUDetail reportUDetail) {
		return mybatisSession.insert("", reportUDetail);
	}






	


}
