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
import com.kh.objet.users.model.vo.EnrollCount;
import com.kh.objet.users.model.vo.LoginCount;
import com.kh.objet.users.model.vo.LoginCount2;
import com.kh.objet.users.model.vo.UserManagement;
import com.kh.objet.users.model.vo.Users;

@Repository("usermDao")
public class UserManagementDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	public UserManagementDao() {}
	public List<UserManagement> selectUser(Map<String, String> map) {
		return mybatisSession.selectList("adminMapper.selectUsers", map);
	}
	public List<UserManagement> selectBlacklist() {
		return mybatisSession.selectList("adminMapper.selectBlacklist");
	}
	public List<UserManagement> selectBlacklistOrder(Map<String, String> map) {
		return mybatisSession.selectList("adminMapper.selectBlacklistOrder", map);
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
	public int insertBlackList(Map<String, Object> map) {
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
	public int updateBlackDate(Map<String, Object> map) {
		return mybatisSession.update("adminMapper.updateBlackDate", map);
	}
	public int selectUserListCount(Map<String, String> map) {
		return mybatisSession.selectOne("adminMapper.selectUserOrderCount", map);
	}
	public List<String> selectUserEnrollDate() {
		return mybatisSession.selectList("adminMapper.selectUserEnrollDate");
	}
	public int selectBlacklistCount() {
		return mybatisSession.selectOne("adminMapper.selectBlacklistCount");
	}
	public int updateRequestStatus(Map<String, String> map) {
		return mybatisSession.update("adminMapper.updateRequestStatus", map);
	}
	public List<LoginCount> selectTodayCount() {
		return mybatisSession.selectList("adminMapper.selectTodayCount");
	}
	public int insertBlackFeed(Map<String, Object> map) {
		return mybatisSession.insert("adminMapper.insertBlackFeed", map);
	}
	public int insertBlackEndFeed(Map<String, String> map) {
		return mybatisSession.insert("adminMapper.insertBlackEndFeed", map);
	}
	public LoginCount selectLoginCountAvg(Map<String, String> map) {
		return mybatisSession.selectOne("adminMapper.selectLoginCountAvg", map);
	}
	public List<LoginCount2> selectLoginCountSum() {
		return mybatisSession.selectList("adminMapper.selectLoginCountSum");
	} 
	public List<LoginCount2> selectLoginCountMonthSum() {
		return mybatisSession.selectList("adminMapper.selectLoginCountMonthSum");
	}
	public List<EnrollCount> selecctEnrollYearSum() {
		return mybatisSession.selectList("adminMapper.selectEnrollYearSum");
	}
	public List<EnrollCount> selectEnrollMonthSum() {
		return mybatisSession.selectList("adminMapper.selectEnrollMonthSum");
	}
	public List<EnrollCount> selectEnrollWeekSum() {
		return mybatisSession.selectList("adminMapper.selectEnrollWeekSum");
	}
}