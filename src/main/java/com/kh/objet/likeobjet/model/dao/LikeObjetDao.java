package com.kh.objet.likeobjet.model.dao;

import java.util.ArrayList;
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
		
		List<LikeObjet> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<LikeObjet>)list;
	}

	// 오브제 관리 - 관심오브제 삭제
	public int deleteMyLikeObjetList(int objetno) {
		return mybatisSession.delete("", objetno);
	}

	// 오브제관리 - 관심오브제 검색용 리스트카운트
	public int myLikeObjetSearchGetListCount(String objettitle, String userid, String objetstatus) {
		// vo따로 만들어야 할듯
		return 0;
	}

	// 오브제 관리 - 관심오브제 검색
	public ArrayList<LikeObjet> selectMyLikeObjetSearch(String objettitle, String userid, String objetstatus, Paging paging) {
		// vo따로 만들어야 할듯
		return null;
	}

}
