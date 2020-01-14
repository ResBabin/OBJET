package com.kh.objet.visitedobjet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

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
	
	
	// 오브제 관리 - 다녀온 오브제 페이지 이동
	public ArrayList<VisitedObjet> moveMyVisitedObjetList(String userid, Paging paging) {
		 int offset = 0;
		 int limit = 0;
		 RowBounds rowBounds = new RowBounds(offset, limit);


		List<VisitedObjet> list = mybatisSession.selectList("usermapper.selectMyVisitedObjetList", userid, rowBounds);
		return (ArrayList<VisitedObjet>) list;
	}

	// 오브제 관리 - 다녀온 오브제 삭제
	public int deleteMyVisitedObjetList(int objetno) {
		return mybatisSession.delete("objetMapper.deleteMyVistiedObjetList", objetno);
	}


	// 오브제 관리 - 다녀온 오브제 검색
	// 새로 vo 만들어야 할듯
	public List<VisitedObjet> selectMyVisitedObjetSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("objetMapper.selectMyVisitedObjetSearch", map);
	}

	public int listCount() {
		return mybatisSession.selectOne("objetMapper.listCount");
	}
	
	public List<VisitedObjet> selectVistiedObjetList(HashMap<String, Object> map){
		return mybatisSession.selectList("objetMapper.selectVistiedObjetList", map);
	}
	
		
	

}
