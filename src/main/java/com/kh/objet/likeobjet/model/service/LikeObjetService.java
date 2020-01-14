package com.kh.objet.likeobjet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.paging.model.vo.Paging;

public interface LikeObjetService {
	
	// 최민영 *************************************
	int myLikeObjetGetListCount(String userid);
	ArrayList<LikeObjet>  moveMyLikeObjetList(String userid, Paging paging);
	int deleteMyLikeObjetList(int objetno);
	List<LikeObjet> selectMyLikeObjetSearch(HashMap<String, Object> map);
	int listCount();

}
