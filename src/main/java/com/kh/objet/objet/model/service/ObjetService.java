package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.objet.model.vo.ReviewUp;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

public interface ObjetService {
	
	//박예은
	ArrayList<Objet> selectObjetAllList();
	ArrayList<Artist> selectArtistAllList();
	ArrayList<Artist> selectArtistListOrder(String order);
	int insertObjetReport(ReportBoard rb);
	int insertReviewReport(ReportBoard rb);
	ArrayList<Objet> selectObjetSearchList(String keyword);
	Artist selectObjetOne(int objetno);
	ArrayList<Review> selectReview(int objetno);
	Review selectReviewOne(ReviewKey rk);
	ArrayList<Review> selectReviewOrder(ReviewKey rk);
	int insertReview(Review review);
	int updateReview(ReviewUp review);
	int deleteReview(Review review);
	int updateRevGood(Review review);
	int updateRevGoodReset(Review review);
	int updateRevHate(Review review);
	int updateRevHateReset(Review review);
	int insertLikeObjet(LikeObjet likeobjet);
	int deleteLikeObjet(LikeObjet likeobjet);
	
	
	// 최민영
	int selectArtistObjetGetListCount(String userid);
	List<Objet> selectArtistObjetList(HashMap<String, Object> map);
	int selectArtistObjetSearchGetListCount(String objettitle);
	List<Objet> selectArtistObjetSearch(HashMap<String, Object> map);
	
	ArrayList<Objet> moveMyObjetList(String userid, Paging paging);
	List<Objet> selectMyObjetSearch(HashMap<String, Object> map);
	Objet moveMyObjetDetail(int objetno);
	Objet moveEditObjet(int objetno);
	int updateMyObjet(Objet objet);
	int insertObjet(Objet objet);
	int deleteObjet(int objetno);
	
}
