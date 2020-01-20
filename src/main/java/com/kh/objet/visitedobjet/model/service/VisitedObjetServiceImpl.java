package com.kh.objet.visitedobjet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.qna.model.vo.Qna;
import com.kh.objet.visitedobjet.model.dao.VisitedObjetDao;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

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
	public ArrayList<VisitedObjet> myVistiedObjetList() {
		return visitedObjetDao.myVistiedObjetList();
	}

	//오브제 관리 - 다녀온 오브제 삭제
	@Override
	public int deleteMyVisitedObjetList(int objetno) {
		return visitedObjetDao.deleteMyVisitedObjetList(objetno);
	}
	
	
	//오브제 관리 - 다녀온 오브제 검색
	@Override
	public List<VisitedObjet> selectMyVisitedObjetSearch(HashMap<String, Object> map) {
		return visitedObjetDao.selectMyVisitedObjetSearch(map);
	}

	@Override
	public int listCount() {
		return visitedObjetDao.listCount();
	}

	@Override
	public List<VisitedObjet> selectVisitedObjetList(HashMap<String, Object> map) {
		return visitedObjetDao.selectVistiedObjetList(map);
	}


	

}
