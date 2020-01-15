package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.likeobjet.model.vo.LikeObjet;
import com.kh.objet.objet.model.dao.ObjetDao;
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

@Service("objetService")
public class ObjetServiceImpl implements ObjetService{

	@Autowired
	private ObjetDao objetDao;
	
	//박예은
	
	//오브제 검색(전시/작가)
	@Override
	public ArrayList<Artist> selectObjetAllSearch(String keyword) {
		return objetDao.selectObjetAllSearch(keyword);
	}
	
	//오브제 검색(전시/작가)
	@Override
	public ArrayList<Artist> selectArtistAllSearch(String keyword) {
		return objetDao.selectArtistAllSearch(keyword);
	}
		
	//오브제 전시 전체 리스트
	@Override
	public ArrayList<Objet> selectObjetAllList() {
		return objetDao.selectObjetAllList();
	}
	
	@Override
	public ArrayList<Artist> selectObjetMainList() {
		return objetDao.selectObjetMainList();
	}
	
	//오브제 완전 전체 리스트
	@Override
	public ArrayList<Objet> selectAllObjetAllList() {
		return objetDao.selectAllObjetAllList();
	}

	//오브제 작가 전체 리스트
	@Override
	public ArrayList<Artist> selectArtistAllList() {
		return objetDao.selectArtistAllList();
	}
	
	//오브제 작가 전체리스트 정렬
	@Override
	public ArrayList<Artist> selectArtistListOrder(String order) {
		return objetDao.selectArtistListOrder(order);
	}
	
	//오브제 신고
	@Override
	public int insertObjetReport(ReportBoard rb) {
		return objetDao.insertObjetReport(rb);
	}

	//오브제 검색결과
	@Override
	public ArrayList<Objet> selectObjetSearchList(String keyword) {
		return null;
	}

	//오브제, 작가 상세보기, 한줄평 리스트, 내 한줄평, 관심오브제 카운트,리스트
	@Override
	public Artist selectObjetOne(int objetno) {
		return objetDao.selectObjetOne(objetno);
	}

	//한줄평 신고
	@Override
	public int insertReviewReport(ReportBoard rb) {
		return objetDao.insertReviewReport(rb);
	}
	
	//한줄평 신고 체크
	@Override
	public int selectReviewReport(ReportBoard rbb) {
		return objetDao.selectReviewReport(rbb);
	}
	
	//한줄평 리스트 
	@Override
	public ArrayList<Review> selectReview(Review review) {
		return objetDao.selectReview(review);
	}
	
	//내 한줄평
	@Override
	public Review selectReviewOne(ReviewKey rk) {
		return objetDao.selectReviewOne(rk);
	}
	
	@Override
	public Review selectReviewStatusOne(ReviewKey rk) {
		return objetDao.selectReviewStatusOne(rk);
	}
	
	//한줄평 리스트 정렬
	@Override
	public ArrayList<Review> selectReviewOrder(ReviewKey rk) {
		return objetDao.selectReviewOrder(rk);
	}
	
	//한줄평 추가
	@Override
	public int insertReview(Review review) {
		return objetDao.insertReview(review);
	}
	
	//한줄평 수정
	@Override
	public int updateReview(Review review) {
		return objetDao.updateReview(review);
	}
	
	//한줄평 삭제
	@Override
	public int deleteReview(Review review) {
		return objetDao.deleteReview(review);
	}
	
	//관심오브제 추가
	@Override
	public int insertLikeObjet(LikeObjet likeobjet) {
		return objetDao.insertLikeObjet(likeobjet);
	}

	//관심오브제 삭제
	@Override
	public int deleteLikeObjet(LikeObjet likeobjet) {
		return objetDao.deleteLikeObjet(likeobjet);
	}

	//관심오브제 리스트
	@Override
	public ArrayList<LikeObjet> selectLikeObjet(int objetno) {
		return objetDao.selectLikeObjet(objetno);
	}
	
	//관심오브제 카운트
	@Override
	public int selectLikeObjetOne(LikeObjet likeobjet) {
		return objetDao.selectLikeObjetOne(likeobjet);
	}
	
	//한줄평 좋아요 체크
	@Override
	public int selectRevGoodChk(ReviewStatus revstatus) {
		return objetDao.selectRevGoodChk(revstatus);
	}
	
	//한줄평 싫어요 체크
	@Override
	public int selectRevHateChk(ReviewStatus revstatus) {
		return objetDao.selectRevHateChk(revstatus);
	}
	
	@Override
	//한줄평 좋아요
	public int insertRevGood(ReviewStatus revstatus) {
		return objetDao.insertRevGood(revstatus);
	}

	@Override
	//한줄평 좋아요 취소
	public int deleteRevGood(ReviewStatus revstatus) {
		return objetDao.deleteRevGood(revstatus);
	}

	@Override
	//한줄평 싫어요
	public int insertRevHate(ReviewStatus revstatus) {
		return objetDao.insertRevHate(revstatus);
	}

	@Override
	//한줄평 싫어요 취소
	public int deleteRevHate(ReviewStatus revstatus) {
		return objetDao.deleteRevHate(revstatus);
	}
	
	@Override
	public int selectLikeObjetCnt(int objetno) {
		return objetDao.selectLikeObjetCnt(objetno);
	}

	@Override
	public int selectReviewCnt(int objetno) {
		return objetDao.selectReviewCnt(objetno);
	}
	
	@Override
	public int selectObjetCnt(String userid) {
		return objetDao.selectObjetCnt(userid);
	}
	
	@Override
	public int selectFollowerCnt(String userid) {
		return objetDao.selectFollowerCnt(userid);
	}
	
	@Override
	public List<Objet> selectArtistObjetStatus(String userid) {
		return objetDao.selectArtistObjetStatus(userid);
	}
	
	@Override
	public int selectFollowingCnt(String userid) {
		return objetDao.selectFollowingCnt(userid);
	}
	
	@Override
	public List<ReviewStatus> selectReviewStatusChk(ReviewKey rk) {
		return objetDao.selectReviewStatusChk(rk);
	}
	
	//다녀온 오브제 추가
	@Override
	public int insertVisitedObjet(VisitedObjet vs) {
		return objetDao.insertVisitedObjet(vs);
	}
	
	@Override
	public int selectVisitedObjet(VisitedObjet vs) {
		return objetDao.selectVisitedObjet(vs);
	}
	
	
	
	// 최민영 *******************************************************
	

	// 작가홈 오브제 리스트 보기		
		@Override
		public List<Objet2> selectArtistObjetList(String userid) {
			return objetDao.selectArtistObjetList(userid);
		}
		
		
	// 작가홈 오브제 검색용 리스트카운트
		@Override
		public int selectArtistObjetSearchGetListCount(String objettitle) {
			return objetDao.selectArtistObjetSearchGetListCount(objettitle);
		}

		
	// 작가홈 오브제 검색
		@Override
		public List<Objet2> selectArtistObjetSearch(HashMap<String, Object> map) {
			return objetDao.selectArtistObjetSearch(map);
		}
	

	// 관심수 가져오기
		@Override
		public int selectlikecount(int objetno) {
			return objetDao.selectlikecount(objetno);
		}
		

	// 리뷰 수 가져오기
		@Override
		public int selectreviewcount(int objetno) {
			return objetDao.selectreviewcount(objetno);
		}
		
		
		
		
	// 박근수
	// 오브제 관리-내 오브제 페이지 이동
	@Override
	public ArrayList<Objet> moveMyObjetList(String userid, Paging paging) {
		return objetDao.moveMyObjetList(userid, paging);
	}

	//오브제 관리-내 오브제 검색
	@Override
	public List<Objet2> selectMyObjetSearch(HashMap<String, Object> map) {
		return objetDao.selectMyObjetSearch(map);
	}
	
	//오브제 관리 - 내 오브제 상세보기
	@Override
	public Objet moveMyObjetDetail(String objettitle) {
		return objetDao.moveMyObjetDetail(objettitle);
	}

	
	//오브제 관리 - 내 오브제 수정 페이지 이동
	@Override
	public Objet moveEditObjet(int objetno) {
		return objetDao.moveEditObjet(objetno);
	}

	
	//오브제 관리 - 내 오브제 수정
	@Override
	public int updateMyObjet(Objet objet) {
		return objetDao.updateMyObjet(objet);
	}

	//오브제 관리 - 전시 등록
	@Override
	public int insertObjet(Objet3 objet3) {
		return objetDao.insertObjet(objet3);
	}

	// 오브제 관리 - 전시 삭제
	@Override
	public int deleteObjet(int objetno) {
		return objetDao.deleteObjet(objetno);
	}
	

	
	
	

	

	
	
	

	
	
	

	



	

	

	

	






	

	
	
}
