package com.kh.objet.likeobjet.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.objet.likeobjet.model.vo.LikeObjet2;

public interface LikeObjetService {
	
	// 최민영 *************************************
	int myLikeObjetGetListCount(String userid);
	List<LikeObjet2>  moveMyLikeObjetList(HashMap<String, Object> map);
	int listCountK();
	int deleteMyLikeObjetList(int objetno);
	List<LikeObjet2> selectMyLikeObjetSearch(HashMap<String, Object> map);
	int selectMyLikeObjetSearchListCount(HashMap<String, Object> map1);

}
