package com.kh.objet.objet.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ObjetManagement;

@Repository("objetmDao")
public class ObjetManagementDao {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	public ObjetManagementDao() {}
	public List<Objet> selectAllObjet(Map<String, Integer> map) { 
		return mybatisSession.selectList("adminMapper.selectAllObjet", map);
	}
	public ObjetManagement selectObjetOne(int objetno) {
		return mybatisSession.selectOne("adminMapper.selectObjetOne", objetno);
	}
	
	public List<Objet> selectObjetReqMain() {
		return mybatisSession.selectList("adminMapper.selectObjetReqMain");
	}
	public int updateRequestStatus(Map<String, String> map) {
		return mybatisSession.update("adminMapper.updateRequestStatus", map);
	}
	public int updateObjetStop(int objetno) {
		return mybatisSession.update("adminMapper.updateObjetStop", objetno);
	}
	public List<Objet> selectStatusOrder(Map<String, String> map) {
		return mybatisSession.selectList("adminMapper.selectStatusOrder", map);
	}
	public List<Objet> selectObjetSearch(Objet objetsearch) {
		return mybatisSession.selectList("adminMapper.selectObjetSearch", objetsearch);
	}
	public int selectObjetListCount() {
		return mybatisSession.selectOne("adminMapper.selectObjetListCount");
	}
	public int selectStatusOrderList(Map<String, String> map) {
		return mybatisSession.selectOne("adminMapper.selectStatusOrderList", map);
	}
	public int selectBeforeStart() {
		return mybatisSession.selectOne("adminMapper.selectBeforeStart");
	}
	public int selectObjetRequestList(Map<String, String> map) {
		return mybatisSession.selectOne("adminMapper.selectObjetRequestCount", map);
	}
	public List<Objet> selectObjetRequestManage(Map<String, String> map) {
		return mybatisSession.selectList("adminMapper.selectObjetRequestList", map);
	}
	public List<Objet> selectObjetRequestManage() {
		return mybatisSession.selectList("adminMapper.selectObjetRequestList2");
	}
	public int insertReqFeed(Map<String, String> map) {
		return mybatisSession.insert("adminMapper.insertReqFeed", map);
	} 
	public int insertStopFeed(Map<String, String> map) {
		return mybatisSession.insert("adminMapper.insertStopFeed", map);
	}

}
