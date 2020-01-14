package com.kh.objet.visitedobjet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

public interface VisitedObjetService {

	
	// 최민영 *****************************
	int myVisitedObjetGetListCount(String userid);
	ArrayList<VisitedObjet> moveMyVisitedObjetList(String userid, Paging paging);
	int deleteMyVisitedObjetList(int objetno);
	List<VisitedObjet> selectMyVisitedObjetSearch(HashMap<String, Object> map);
	int listCount();
	List<VisitedObjet> selectVisitedObjetList(HashMap<String, Object> map);
}
