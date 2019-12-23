package com.kh.objet.visitedobjet.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.paging.model.vo.Paging;
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
	
	
	// 오브제 관리 - 다녀온 오브제 페이지 이동
	@Override
	public ArrayList<VisitedObjet> moveMyVisitedObjetList(String userid, Paging paging) {
		return visitedObjetDao.moveMyVisitedObjetList(userid, paging);
	}

	//오브제 관리 - 다녀온 오브제 삭제
	@Override
	public int deleteMyVisitedObjetList(int objetno) {
		return visitedObjetDao.deleteMyVisitedObjetList(objetno);
	}
	
	// 오브제관리 - 다녀온 오브제 검색용 리스트 카운트
	@Override
	public int myVisitedObjetSearchGetListCount(String objettitle, String userid, String objetstatus) {
		return visitedObjetDao.myVisitedObjetSearchGetListCount(objettitle, userid, objetstatus);
	}
	
	
	//오브제 관리 - 다녀온 오브제 검색
	@Override
	public ArrayList<VisitedObjet> selectMyVisitedObjetSearch(String objettitle, String userid, String objetstatus, Paging paging) {
		return visitedObjetDao.selectMyVisitedObjetSearch(objettitle, userid, objetstatus, paging);
	}


	

}
