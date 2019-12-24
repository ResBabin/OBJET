package com.kh.objet.users.model.service;

import java.util.ArrayList;

import com.kh.objet.quit.model.vo.Quit;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UAUP;
import com.kh.objet.users.model.vo.Users;

public interface UsersService {
	//최민영 ***********************************
	int selectCheckId(String userid);
	
	int selectCheckNickname(String nickname);
	
	int insertUsers(Users users);
	
	int insertUsersProfile(String userid);
	
	UAUP selectUsersLogin(UAUP users);
	
	ArrayList<Users> selectFindId(Users users);
	
	Users selectFindPwd(Users users);
	
	int updateUserPwd(Users users);
	
	Users moveMyPageEdit(String userid);
	
	int updateMyPage(Users users);

	int updateQuitUser(String userid);
	
	int insertQuitUser(Quit quit);
	
	int insertUsersReport(ReportUDetail reportUDetail);
}
