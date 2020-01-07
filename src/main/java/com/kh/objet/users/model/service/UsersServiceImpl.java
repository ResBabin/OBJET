package com.kh.objet.users.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.quit.model.vo.Quit2;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.dao.UsersDao;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.users.model.vo.Users;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao usersDao;
	
	
	//최민영 ***********************************
	// 아이디 중복확인
	@Override
	public int selectCheckId(String userid) {
		return usersDao.selectCheckId(userid);
	}
	
	// 닉네임 중복확인
	@Override
	public int selectCheckNickname(String nickname) {
		return usersDao.selectCheckNickname(nickname);
	}
	
	
	// 이메일 중복확인
	@Override
	public int selectCheckEmail(String email) {
		return usersDao.selectCheckEmail(email);
	}
	
	// 회원가입
	@Override
	public int insertUsers(Users users) {
		return usersDao.insertUsers(users);
	}
	
	// 회원가입시 usersprofile 추가
	@Override
	public int insertUsersProfile(String userid) {
		return usersDao.insertUsersProfile(userid);
	}

	// 회원 로그인
	@Override
	public UAUP selectUsersLogin(UAUP users) {
		return usersDao.selectUsersLogin(users);
	}

	// 아이디찾기
	@Override
	public Users selectFindId(Users users) {
		return usersDao.selectFindId(users);
	}

	// 비밀번호 찾기
	@Override
	public Users selectFindPwd(Users users) {
		return usersDao.selectFindPwd(users);
	}
	
	// 임시비밀번호 수정
	public int updateUserPwd(Users users) {
		return usersDao.updateUserPwd(users);
	}
	
	// 내정보 수정 페이지 이동
	@Override
	public Users moveMyPageEdit(String userid) {
		return usersDao.moveMyPageEdit(userid);
	}

	// 내정보 수정
	@Override
	public int updateMyPage(Users users) {
		return usersDao.updateMyPage(users);
	}
	
	// 회원탈퇴1
	@Override
	public int updateQuitUser(String userid) {
		// TODO Auto-generated method stub
		return usersDao.updateQuitUser(userid);
	}

	// 회원탈퇴2
	@Override
	public int insertQuitUser(Quit2 quit) {
		return usersDao.insertQuitUser(quit);
	}
	
	
	// 작가 신고하기
	@Override
	public int insertUsersReport(ReportUDetail reportUDetail) {
		return usersDao.insertUsersReport(reportUDetail);
	}

	// 작가 중복신고 확인
	@Override
	public int selectUsersReportOverlap(ReportUDetail reportUDetail) {
		return usersDao.selectUsersReportOverlap(reportUDetail);
	}

	// 탈퇴회원 30일경과후 users테이블에서 삭제
	public void dropQuitUser(String userid) {
		usersDao.dropQuitUser(userid);
	}




}
