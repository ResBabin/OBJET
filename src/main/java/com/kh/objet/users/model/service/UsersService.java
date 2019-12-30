package com.kh.objet.users.model.service;

import com.kh.objet.quit.model.vo.Quit2;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.users.model.vo.Users;

public interface UsersService {
	//최민영 ***********************************
	int selectCheckId(String userid);
	
	int selectCheckNickname(String nickname);
	
	int selectCheckEmail(String email);
	
	int insertUsers(Users users);
	
	int insertUsersProfile(String userid);
	
	UAUP selectUsersLogin(UAUP users);
	
	Users selectFindId(Users users);
	
	Users selectFindPwd(Users users);
	
	int updateUserPwd(Users users);
	
	Users moveMyPageEdit(String userid);
	
	int updateMyPage(Users users);

	int updateQuitUser(String userid);
	
	int insertQuitUser(Quit2 quit);
	
	int insertUsersReport(ReportUDetail reportUDetail);
	
	int selectUsersReportOverlap(ReportUDetail reportUDetail);

	
}
