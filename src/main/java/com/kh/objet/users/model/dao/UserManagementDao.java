package com.kh.objet.users.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.blacklist.model.vo.BlackList;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportudetail.model.vo.ReportUDetail;
import com.kh.objet.users.model.vo.LoginCount;
import com.kh.objet.users.model.vo.UserManagement;
import com.kh.objet.users.model.vo.Users;

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
	public LoginCount selectTodayCount(String today) {
		return mybatisSession.selectOne("adminMapper.selectTodayCount", today);
	}
	public int updateLoginCount(String upcount) {
		return mybatisSession.update("adminMapper.updateLoginCount", upcount);
	}
	public int insertLoginCount() {
		return mybatisSession.insert("adminMapper.insertLoginCount");
	}
	public String selectLoginDate() {
		return mybatisSession.selectOne("adminMapper.selectLoginDate");
	}
	public List<Users> selectEnrollCount() {
		return mybatisSession.selectList("adminMapper.selectEnrollCount");
	}
	public int insertBlackList(Map<String, String> map) {
		return mybatisSession.insert("adminMapper.insertBlackList", map); 
	}
	public int updateBlackYN(String userid) {
		return mybatisSession.update("adminMapper.updateBlackYN", userid);
	}
	public int updateQuitYN(Map<String, String> map) {
		return mybatisSession.update("adminMapper.updateQuitYN", map);
	}
	public int insertQuit (Map<String, String> map) {
		return mybatisSession.insert("adminMapper.insertQuit", map);
	}
	public int deleteBlackList(String userid) {
		return mybatisSession.delete("adminMapper.deleteBlackList", userid);
	}
	public int updateBlackEnd(String userid) {
		return mybatisSession.delete("adminMapper.updateBlackEnd", userid);
	}
	public List<UserManagement> selectUserOrder(Map<String, String> map) {
		return mybatisSession.selectList("adminMapper.selectUserOrder", map);
	}
	public int updateBlackDate(Map<String, String> map) {
		return mybatisSession.update("adminMapper.updateBlackDate", map);
	}
	
}