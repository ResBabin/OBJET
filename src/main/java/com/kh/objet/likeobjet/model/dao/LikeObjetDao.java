package com.kh.objet.likeobjet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.paging.model.vo.Paging;

@Repository("likeObjetDao")
public class LikeObjetDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public LikeObjetDao() {}

	// 오브제 관리 - 관심오브제 리스트카운트 용
	public int myLikeObjetGetListCount(String userid) {
		return mybatisSession.delete("", userid);
	}

	// 오브제 관리 - 관심오브제 페이지 이동
	public ArrayList<LikeObjet> moveMyLikeObjetList(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<LikeObjet> list = mybatisSession.selectList("objetMapper.selectLikeObjetList", userid, rowBounds);
		return (ArrayList<LikeObjet>)list;
	}

	// 오브제 관리 - 관심오브제 삭제
	public int deleteMyLikeObjetList(int objetno) {
		return mybatisSession.delete("objetMapper.deleteMyLikeObjetList", objetno);
	}


	// 오브제 관리 - 관심오브제 검색
	public List<LikeObjet> selectMyLikeObjetSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("objetMapper.selectMyLikeObjetSearch", map);
	}
	
	public int listCountK() {
		return mybatisSession.selectOne("objetMapper.listCountK");
	}
	

}
