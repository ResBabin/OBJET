package com.kh.objet.likeobjet.model.service;

import java.util.ArrayList;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.paging.model.vo.Paging;

public interface LikeObjetService {
	
	// 최민영 *************************************
	int myLikeObjetGetListCount(String userid);
	ArrayList<LikeObjet>  moveMyLikeObjetList(String userid, Paging paging);
	int deleteMyLikeObjetList(int objetno);
	int myLikeObjetSearchGetListCount(String objettitle, String userid, String objetstatus);
	ArrayList<LikeObjet> selectMyLikeObjetSearch(String objettitle, String userid, String objetstatus, Paging paging);

}
