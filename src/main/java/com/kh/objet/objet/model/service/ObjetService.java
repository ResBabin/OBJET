package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.Objet2;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.objet.model.vo.ReviewUp;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;
import com.kh.objet.review.model.vo.ReviewStatus;

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
	int insertLikeObjet(LikeObjet likeobjet);
	int deleteLikeObjet(LikeObjet likeobjet);
	ArrayList<LikeObjet> selectLikeObjet(int objetno);
	int selectLikeObjetOne(LikeObjet likeobjet);
	ArrayList<ReviewStatus> selectReivewStatus(ReviewStatus review);
	int selectRevGoodChk(ReviewStatus revstatus);
	int updateRevGood(ReviewStatus revstatus);
	int updateRevGoodReset(ReviewStatus revstatus);
	int updateRevHate(ReviewStatus revstatus);
	int updateRevHateReset(ReviewStatus revstatus);
	
	// 최민영
	List<Objet2> selectArtistObjetList(String userid);
	int selectArtistObjetSearchGetListCount(String objettitle);
	List<Objet2> selectArtistObjetSearch(HashMap<String, Object> map);
	int selectlikecount(int objetno);
	int selectreviewcount(int objetno);
	
	// 박근수
	ArrayList<Objet> moveMyObjetList(String userid, Paging paging);
	List<Objet> selectMyObjetSearch(HashMap<String, Object> map);
	Objet moveMyObjetDetail(int objetno);
	Objet moveEditObjet(int objetno);
	int updateMyObjet(Objet objet);
	int insertObjet(Objet objet);
	int deleteObjet(int objetno);
	
}
