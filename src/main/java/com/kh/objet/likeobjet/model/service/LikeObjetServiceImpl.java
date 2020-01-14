package com.kh.objet.likeobjet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.likeobjet.model.dao.LikeObjetDao;
import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.paging.model.vo.Paging;

@Service("likeObjetService")
public class LikeObjetServiceImpl implements LikeObjetService{

	@Autowired
	private LikeObjetDao likeObjetDao;

	// 최민영 *************************************
	// 오브제 관리 - 관심오브제 리스트카운트 용
	@Override
	public int myLikeObjetGetListCount(String userid) {
		return likeObjetDao.myLikeObjetGetListCount(userid);
	}
	
	// 오브제 관리 - 관심오브제 페이지 이동
	@Override
	public ArrayList<LikeObjet> moveMyLikeObjetList(String userid, Paging paging) {
		return likeObjetDao.moveMyLikeObjetList(userid, paging);
	}
	
	// 오브제 관리 - 관심오브제 삭제
	@Override
	public int deleteMyLikeObjetList(int objetno) {
		return likeObjetDao.deleteMyLikeObjetList(objetno);
	}
	
	
	// 오브제 관리 - 관심오브제 검색
	@Override
	public List<LikeObjet> selectMyLikeObjetSearch(HashMap<String, Object> map) {
		return likeObjetDao.selectMyLikeObjetSearch(map);
	}

	public int listCount() {
		return likeObjetDao.listCount();
	}


}
