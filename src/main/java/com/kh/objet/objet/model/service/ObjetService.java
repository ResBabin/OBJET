package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.Objet2;
import com.kh.objet.objet.model.vo.Objet3;
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;
import com.kh.objet.review.model.vo.ReviewStatus;
import com.kh.objet.visitedobjet.model.vo.VisitedObjet;

public interface ObjetService {
	
	//박예은
	ArrayList<Objet> selectObjetAllList();
	ArrayList<Artist> selectArtistAllList();
	ArrayList<Artist> selectArtistListOrder(String order);
	int insertObjetReport(ReportBoard rb);
	int insertReviewReport(ReportBoard rb);
	ArrayList<Objet> selectObjetSearchList(String keyword);
	Artist selectObjetOne(int objetno);
	ArrayList<Review> selectReview(Review review);
	Review selectReviewOne(ReviewKey rk);
	Review selectReviewStatusOne(ReviewKey rk);
	ArrayList<Review> selectReviewOrder(ReviewKey rk);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(Review review);
	int insertLikeObjet(LikeObjet likeobjet);
	int deleteLikeObjet(LikeObjet likeobjet);
	ArrayList<LikeObjet> selectLikeObjet(int objetno);
	int selectLikeObjetOne(LikeObjet likeobjet);
	int selectRevGoodChk(ReviewStatus revstatus);
	int selectRevHateChk(ReviewStatus revstatus);
	int insertRevGood(ReviewStatus revstatus);
	int deleteRevGood(ReviewStatus revstatus);
	int insertRevHate(ReviewStatus revstatus);
	int deleteRevHate(ReviewStatus revstatus);
	int selectReviewReport(ReportBoard rbb);
	ArrayList<Objet> selectAllObjetAllList();
	ArrayList<Artist> selectObjetMainList();
	ArrayList<Artist> selectObjetAllSearch(String keyword);
	ArrayList<Artist> selectArtistAllSearch(String keyword);
	int selectLikeObjetCnt(int objetno);
	int selectReviewCnt(int objetno);
	int selectObjetCnt(String userid);
	int selectFollowerCnt(String userid);
	List<Objet> selectArtistObjetStatus(String userid);
	int selectFollowingCnt(String userid);
	List<ReviewStatus> selectReviewStatusChk(ReviewKey rk);
	int insertVisitedObjet(VisitedObjet vs);
	int selectVisitedObjet(VisitedObjet vs);
	
	
	// 최민영
	List<Objet2> selectArtistObjetList(String userid);
	int selectArtistObjetSearchGetListCount(String objettitle);
	List<Objet2> selectArtistObjetSearch(HashMap<String, Object> map);
	int selectlikecount(int objetno);
	int selectreviewcount(int objetno);
	
	// 박근수
	ArrayList<Objet> moveMyObjetList(String userid, Paging paging);
	List<Objet2> selectMyObjetSearch(HashMap<String, Object> map);
	Objet moveMyObjetDetail(String objettitle);
	Objet moveEditObjet(int objetno);
	int updateMyObjet(Objet objet);
	int insertObjet(Objet3 objet3);
	int deleteObjet(int objetno);
	
	
	
	
	
	

	
	
	
	
	
}
