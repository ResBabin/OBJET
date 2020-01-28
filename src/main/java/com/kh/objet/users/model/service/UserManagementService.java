package com.kh.objet.users.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.objet.blacklist.model.vo.BlackList;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.EnrollCount;
import com.kh.objet.users.model.vo.LoginCount;
import com.kh.objet.users.model.vo.LoginCount2;
import com.kh.objet.users.model.vo.UserManagement;
import com.kh.objet.users.model.vo.Users;

public interface UserManagementService {
	public List<UserManagement> selectUser(Map<String, String> map);
	public List<UserManagement> selectBlacklist();
	public List<UserManagement> selectBlacklistOrder(Map<String, String> map);
	public UserManagement selectUserDetail(String userid);
	public List<Objet> selectUserObjet(String userid);
	public List<ReportUDetail> selectUserReport(String userid);
	public List<ReportUDetail> selectUserReportTotal(String userid);
	public List<ReportUDetail> selectReportUDetailMain();
	public LoginCount selectTodayCount(String today);
	public int updateLoginCount(String upcount);
	public int insertLoginCount();
	public String selectLoginDate();
	public List<Users> selectEnrollCount();
	public int insertBlackList(Map<String, Object> map);
	public int updateBlackYN(String userid);
	public int updateQuitYN(Map<String, String> map);
	public int insertQuit (Map<String, String> map);
	public int deleteBlackList(String userid);
	public int updateBlackEnd(String userid);
	public List<UserManagement> selectUserOrder(Map<String, String> map);
	public int updateBlackDate(Map<String, Object> map);
	public int selectUserListCount(Map<String, String> map);
	public List<String> selectUserEnrollDate();
	public int selectBlacklistCount();
	public int updateRequestStatus(Map<String, String> map);
	public int selectStatusOrderList(Map<String, String> map);
	public List<LoginCount> selectTodayCount();
	public int insertBlackFeed(Map<String, Object> map);
	public int insertBlackEndFeed(Map<String, String> map);
	public LoginCount selectLoginCountAvg(Map<String, String> map);
	public List<LoginCount2> selectLoginCountSum();
	public List<LoginCount2> selectLoginCountMonthSum();
	public List<EnrollCount> selectEnrollYearSum();
	public List<EnrollCount> selectEnrollMonthSum();
	public List<EnrollCount> selectEnrollWeekSum();

}