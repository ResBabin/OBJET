package com.kh.objet.users.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.dao.UserManagementDao;
import com.kh.objet.users.model.vo.LoginCount;
import com.kh.objet.users.model.vo.UserManagement;
import com.kh.objet.users.model.vo.Users;

@Service("usermService")
public class UserManagementServiceImpl implements UserManagementService{
	
	@Autowired
	private UserManagementDao usermDao;
	
	@Override
	public List<UserManagement> selectUser(Map<String, String> map) {
		return usermDao.selectUser(map);
	}
	
	@Override
	public List<UserManagement> selectBlacklist() {
		return usermDao.selectBlacklist();
	}

	@Override
	public List<UserManagement> selectBlacklistOrder(String order) {
		return usermDao.selectBlacklistOrder(order);
	}

	@Override
	public UserManagement selectUserDetail(String userid) {
		return usermDao.selectUserDetail(userid);
	}

	@Override
	public List<Objet> selectUserObjet(String userid) {
		return usermDao.selectUserObjet(userid);
	}

	@Override
	public List<ReportUDetail> selectUserReport(String userid) {
		return usermDao.selectUserReport(userid);
	}

	@Override
	public List<ReportUDetail> selectUserReportTotal(String userid) {
		return usermDao.selectUserReportTotal(userid);
	}

	@Override
	public List<ReportUDetail> selectReportUDetailMain() {
		return usermDao.selectReportuDetailMain();
	}

	@Override
	public LoginCount selectTodayCount(String today) {
		return usermDao.selectTodayCount(today);
	}

	@Override
	public int updateLoginCount(String upcount) {
		return usermDao.updateLoginCount(upcount);
	}

	@Override
	public int insertLoginCount() {
		return usermDao.insertLoginCount();
	}

	@Override
	public String selectLoginDate() {
		return usermDao.selectLoginDate();
	}

	@Override
	public List<Users> selectEnrollCount() {
		return usermDao.selectEnrollCount();
	}

	@Override
	public int insertBlackList(Map<String, String> map) {
		return usermDao.insertBlackList(map);
	}

	@Override
	public int updateBlackYN(String userid) {
		return usermDao.updateBlackYN(userid);
	}

	@Override
	public int updateQuitYN(Map<String, String> map) {
		return usermDao.updateQuitYN(map);
	}

	@Override
	public int insertQuit(Map<String, String> map) {
		return usermDao.insertQuit(map);
	}

	@Override
	public int deleteBlackList(String userid) {
		return usermDao.deleteBlackList(userid);
	}

	@Override
	public int updateBlackEnd(String userid) {
		return usermDao.updateBlackEnd(userid);
	}

	@Override
	public List<UserManagement> selectUserOrder(Map<String, String> map) {
		return usermDao.selectUserOrder(map);
	}

	@Override
	public int updateBlackDate(Map<String, String> map) {
		return usermDao.updateBlackDate(map);
	}

	@Override
	public int selectUserListCount(Map<String, String> map) {
		return usermDao.selectUserListCount(map);
	}

	@Override
	public List<String> selectUserEnrollDate() {
		return usermDao.selectUserEnrollDate();
	}

	@Override
	public int selectBlacklistCount() {
		return usermDao.selectBlacklistCount();
	}

	@Override
	public int updateRequestStatus(Map<String, String> map) {
		return usermDao.updateRequestStatus(map);
	}

	@Override
	public int selectStatusOrderList(Map<String, String> map) {
		return 0;
	}



}