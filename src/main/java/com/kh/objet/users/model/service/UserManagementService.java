package com.kh.objet.users.model.service;

import java.util.List;

import com.kh.objet.blacklist.model.vo.BlackList;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UserManagement;

public interface UserManagementService {
	public List<UserManagement> selectUser();
	public List<UserManagement> selectBlacklist();
	public List<UserManagement> selectBlacklistOrder(String order);
	public UserManagement selectUserDetail(String userid);
	public List<Objet> selectUserObjet(String userid);
	public List<ReportUDetail> selectUserReport(String userid);
	public List<ReportUDetail> selectUserReportTotal(String userid);
	public List<ReportUDetail> selectReportUDetailMain();
}