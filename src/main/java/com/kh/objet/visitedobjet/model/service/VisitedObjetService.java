package com.kh.objet.visitedobjet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.visitedobjet.model.vo.VisitedObjet;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet2;

public interface VisitedObjetService {

	
	// 최민영 *****************************
	int myVisitedObjetGetListCount(String userid);
	List<VisitedObjet2> myVisitedObjetList(HashMap<String, Object> map);
	int deleteMyVisitedObjetList(int objetno);
	int listCount();
	List<VisitedObjet2> selectMyVisitedObjetSearch(HashMap<String, Object> map2);
	int selectMyVisitedObjetSearchListCount(HashMap<String, Object> map1);
}
