package com.kh.objet.visitedobjet.model.service;

import java.util.ArrayList;

import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

public interface VisitedObjetService {

	
	// 최민영 *****************************
	int myVisitedObjetGetListCount(String userid);
	ArrayList<VisitedObjet> moveMyVisitedObjetList(String userid, Paging paging);
	int deleteMyVisitedObjetList(int objetno);
	int myVisitedObjetSearchGetListCount(String objettitle, String userid, String objetstatus);
	ArrayList<VisitedObjet> selectMyVisitedObjetSearch(String objettitle, String userid, String objetstatus, Paging paging);
}
