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
		return mybatisSession.selectList("usermMapper.selectUsers");
	}
	public List<BlackList> selectBlacklist() {
		return mybatisSession.selectList("usermMapper.selectBlacklist");
	}
	public UserManagement selectUserDetail(String userid) {
		return mybatisSession.selectOne("usermMapper.selectUserDetail", userid);
	}
	public List<Objet> selectUserObjet(String userid) {
		return mybatisSession.selectList("usermMapper.selectUserObjet", userid);
	}
	public List<ReportUDetail> selectUserReport(String userid) {
		return mybatisSession.selectList("usermMapper.selectUserReport", userid);
	}
	public List<ReportUDetail> selectUserReportTotal(String userid) {
		return mybatisSession.selectList("usermMapper.selectUserReportTotal", userid);
	}
}