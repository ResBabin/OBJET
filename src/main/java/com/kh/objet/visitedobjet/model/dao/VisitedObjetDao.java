package com.kh.objet.visitedobjet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.visitedobjet.model.vo.VisitedObjet;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet2;

@Repository("visitedObjetDao")
public class VisitedObjetDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public VisitedObjetDao() {}

	
	// 최민영 ************************************
	// 다녀온 오브제 갯수 조회
	public int myVisitedObjetGetListCount(String userid) {
		int result = mybatisSession.selectOne("objetMapper.listCount", userid);
		return result;
	}
	
	// 오브제 관리 - 다녀온 오브제 전체 리스트 조회
	public List<VisitedObjet2> myVisitedObjetList(HashMap<String, Object> map){
		List<VisitedObjet2> list = mybatisSession.selectList("objetMapper.selectVistiedObjetList", map);
		return list;
	}
	
	// 오브제 관리 - 다녀온 오브제 삭제
	public int deleteMyVisitedObjetList(int objetno) {
		return mybatisSession.delete("objetMapper.deleteMyVistiedObjetList", objetno);
	}
	
	public int listCount() {
		return mybatisSession.selectOne("objetMapper.listCount");
	}

	// 오브제 관리 - 다녀온 오브제 검색
	public List<VisitedObjet2> selectMyVisitedObjetSearch(HashMap<String, Object> map2) {
		return mybatisSession.selectList("objetMapper.selectMyVisitedObjetSearch", map2);
	}

	public int selectMyVisitedObjetSearchListCount(HashMap<String, Object> map1) {
		return mybatisSession.selectOne("objetMapper.selectMyVisitedObjetSearchListCount", map1);
	}
	
		
	

}
