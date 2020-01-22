package com.kh.objet.likeobjet.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.likeobjet.model.vo.LikeObjet2;

@Repository("likeObjetDao")
public class LikeObjetDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public LikeObjetDao() {}

	// 오브제 관리 - 관심오브제 리스트카운트 용
	public int myLikeObjetGetListCount(String userid) {
		int result = mybatisSession.selectOne("objetMapper.listCount", userid);
		return result;
	}

	// 오브제 관리 - 관심오브제 페이지 이동
	public List<LikeObjet2> moveMyLikeObjetList(HashMap<String, Object> map) {
		List<LikeObjet2> list = mybatisSession.selectList("objetMapper.selectLikeObjetList", map);
		return list;
	}
	
	// 오브제 관리 - 관심오브제 삭제
	public int deleteMyLikeObjetList(int objetno) {
		return mybatisSession.delete("objetMapper.deleteMyLikeObjetList", objetno);
	}
	
	public int listCountK() {
		return mybatisSession.selectOne("objetMapper.listCountK");
	}

	// 오브제 관리 - 관심오브제 검색
	public List<LikeObjet2> selectMyLikeObjetSearch(HashMap<String, Object> map2) {
		return mybatisSession.selectList("objetMapper.selectMyLikeObjetSearch", map2);
	}
	
	public int selectMyLikeObjetSearchListCount(HashMap<String, Object> map1) {
		return mybatisSession.selectOne("objetMapper.selectMyLikeObjetSearchListCount", map1);
	}
	
	
	

}
