package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;

public interface ObjetService {
	
	//박예은
	ArrayList<Objet> selectObjetAllList();
	ArrayList<Artist> selectArtistAllList();
	ArrayList<Artist> selectArtistListOrder(String order);
	int insertObjetReport(ReportBoard rb);
	int insertReviewReport(ReportBoard rb);
	ArrayList<Objet> selectObjetSearchList(String keyword);
	Artist selectObjetOne(int objetno);
	
	// 최민영
	int selectArtistObjetGetListCount(String userid);
	List<Objet> selectArtistObjetList(HashMap<String, Object> map);
	int selectArtistObjetSearchGetListCount(String objettitle);
	ArrayList<Objet> selectArtistObjetSearch(String objettitle, Paging paging);
	
	ArrayList<Objet> moveMyObjetList(String userid, Paging paging);
	ArrayList<Objet> selectMyObjetSearch(String publicyn, String objetstatus, String objettitle, Paging paging);
	Objet moveMyObjetDetail(int objetno);
	Objet moveEditObjet(int objetno);
	int updateMyObjet(Objet objet);
	int insertObjet(Objet objet);
	int deleteObjet(int objetno);
	
}
