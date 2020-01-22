package com.kh.objet.likeobjet.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.likeobjet.model.dao.LikeObjetDao;
import com.kh.objet.likeobjet.model.vo.LikeObjet2;

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
	public List<LikeObjet2> moveMyLikeObjetList(HashMap<String, Object> map) {
		return likeObjetDao.moveMyLikeObjetList(map);
	}
	
	public int listCountK() {
		return likeObjetDao.listCountK();
	}
	
	// 오브제 관리 - 관심오브제 삭제
	@Override
	public int deleteMyLikeObjetList(int objetno) {
		return likeObjetDao.deleteMyLikeObjetList(objetno);
	}
	
	
	// 오브제 관리 - 관심오브제 검색
	@Override
	public List<LikeObjet2> selectMyLikeObjetSearch(HashMap<String, Object> map2) {
		return likeObjetDao.selectMyLikeObjetSearch(map2);
	}

	// 오브제 관리 - 관심오브제 검색 리스트 카운트
	@Override
	public int selectMyLikeObjetSearchListCount(HashMap<String, Object> map1) {
		return likeObjetDao.selectMyLikeObjetSearchListCount(map1);
	}


}
