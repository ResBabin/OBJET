package com.kh.objet.users.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.blacklist.model.vo.BlackList;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.UserManagement;

@Repository("usermDao")
public class UserManagementDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	public UserManagementDao() {}
	public List<UserManagement> selectUser() {
		return mybatisSession.selectList("adminMapper.selectUsers");
	}
	public List<UserManagement> selectBlacklist() {
		return mybatisSession.selectList("adminMapper.selectBlacklist");
	}
	public List<UserManagement> selectBlacklistOrder(String order) {
		return mybatisSession.selectList("adminMapper.selectBlacklistOrder", order);
	}
	public UserManagement selectUserDetail(String userid) {
		return mybatisSession.selectOne("adminMapper.selectUserDetail", userid);
	}
	public List<Objet> selectUserObjet(String userid) {
		return mybatisSession.selectList("adminMapper.selectUserObjet", userid);
	}
	public List<ReportUDetail> selectUserReport(String userid) {
		return mybatisSession.selectList("adminMapper.selectUserReport", userid);
	}
	public List<ReportUDetail> selectUserReportTotal(String userid) {
		return mybatisSession.selectList("adminMapper.selectUserReportTotal", userid);
	}
	public List<ReportUDetail> selectReportuDetailMain() {
		return mybatisSession.selectList("adminMapper.selectReportUDetailMain");
	}
	

}