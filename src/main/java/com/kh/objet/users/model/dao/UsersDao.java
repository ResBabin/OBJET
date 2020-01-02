package com.kh.objet.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.quit.model.vo.Quit2;
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
	
	// 이메일 중복확인
	public int selectCheckEmail(String email) {
		return mybatisSession.selectOne("userMapper.selectCheckEmail", email);
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
	public Users selectFindId(Users users) {
		return mybatisSession.selectOne("userMapper.selectFindId",users);
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
		return mybatisSession.update("userMapper.updateMyPage", users);
	}

	// 회원탈퇴1
	public int updateQuitUser(String userid) {
		return mybatisSession.update("userMapper.updateQuitUser", userid);
	}
	
	// 회원탈퇴2
	public int insertQuitUser(Quit2 quit) {
		return mybatisSession.insert("userMapper.insertQuitUser", quit);
	}

	// 작가 신고하기
	public int insertUsersReport(ReportUDetail reportUDetail) {
		return mybatisSession.insert("userMapper.insertUsersReport", reportUDetail);
	}

	// 작가 중복신고 확인
	public int selectUsersReportOverlap(ReportUDetail reportUDetail) {
		return mybatisSession.selectOne("userMapper.selectUsersReportOverlap",reportUDetail);
	}








	


}
