package com.kh.objet.users.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.users.model.dao.UserManagementDao;
import com.kh.objet.blacklist.model.vo.BlackList;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UserManagement;

@Service("usermService")
public class UserManagementServiceImpl implements UserManagementService{
	
	@Autowired
	private UserManagementDao usermDao;
	
	@Override
	public List<UserManagement> selectUser() {
		return usermDao.selectUser();
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

	

}