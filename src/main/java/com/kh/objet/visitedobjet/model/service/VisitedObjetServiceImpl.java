package com.kh.objet.visitedobjet.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.visitedobjet.model.dao.VisitedObjetDao;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet2;

@Service("visitedObjetService")
public class VisitedObjetServiceImpl implements VisitedObjetService {

	@Autowired
	private VisitedObjetDao visitedObjetDao;

	
	// 최민영 ************************************
	// 다녀온 오브제 갯수 조회
	@Override
	public int myVisitedObjetGetListCount(String userid) {
		return visitedObjetDao.myVisitedObjetGetListCount(userid);
	}
	
	
	// 오브제 관리 - 다녀온 오브제 전체 리스트 조회
	@Override
	public List<VisitedObjet2> myVisitedObjetList(HashMap<String, Object> map) {
		return visitedObjetDao.myVisitedObjetList(map);
	}

	//오브제 관리 - 다녀온 오브제 삭제
	@Override
	public int deleteMyVisitedObjetList(int objetno) {
		return visitedObjetDao.deleteMyVisitedObjetList(objetno);
	}
	
	@Override
	public int listCount() {
		return visitedObjetDao.listCount();
	}
	
	//오브제 관리 - 다녀온 오브제 검색
	@Override
	public List<VisitedObjet2> selectMyVisitedObjetSearch(HashMap<String, Object> map2) {
		return visitedObjetDao.selectMyVisitedObjetSearch(map2);
	}
	
	@Override
	public int selectMyVisitedObjetSearchListCount(HashMap<String, Object> map1) {
		return visitedObjetDao.selectMyVisitedObjetSearchListCount(map1);
	}



	

}
