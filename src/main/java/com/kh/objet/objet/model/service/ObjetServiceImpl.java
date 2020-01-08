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
import com.kh.objet.objet.model.vo.ReviewKey;
import com.kh.objet.objet.model.vo.ReviewUp;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;
import com.kh.objet.review.model.vo.ReviewStatus;

@Service("objetService")
public class ObjetServiceImpl implements ObjetService{

	@Autowired
	private ObjetDao objetDao;
	
	//박예은
	//오브제 전시 전체 리스트
	@Override
	public ArrayList<Objet> selectObjetAllList() {
		return objetDao.selectObjetAllList();
	}

	//오브제 작가 전체 리스트
	@Override
	public ArrayList<Artist> selectArtistAllList() {
		return objetDao.selectArtistAllList();
	}
	
	//오브제 작가 전체리스트 정렬
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
	
	//한줄평 리스트 
	@Override
	public ArrayList<Review> selectReview(int objetno) {
		return objetDao.selectReview(objetno);
	}
	
	//내 한줄평
	public Review selectReviewOne(ReviewKey rk) {
		return objetDao.selectReviewOne(rk);
	}
	
	//한줄평 리스트 정렬
	public ArrayList<Review> selectReviewOrder(ReviewKey rk) {
		return objetDao.selectReviewOrder(rk);
	}
	
	//한줄평 추가
	public int insertReview(Review review) {
		return objetDao.insertReview(review);
	}
	
	//한줄평 수정
	public int updateReview(ReviewUp review) {
		return objetDao.updateReview(review);
	}
	
	//한줄평 삭제
	public int deleteReview(Review review) {
		return objetDao.deleteReview(review);
	}
	
	//관심오브제 추가
	public int insertLikeObjet(LikeObjet likeobjet) {
		return objetDao.insertLikeObjet(likeobjet);
	}

	//관심오브제 삭제
	public int deleteLikeObjet(LikeObjet likeobjet) {
		return objetDao.deleteLikeObjet(likeobjet);
	}

	//관심오브제 리스트
	public ArrayList<LikeObjet> selectLikeObjet(int objetno) {
		return objetDao.selectLikeObjet(objetno);
	}
	
	//관심오브제 카운트
	public int selectLikeObjetOne(LikeObjet likeobjet) {
		return objetDao.selectLikeObjetOne(likeobjet);
	}
	
	//한줄평 평가 리스트
	public ArrayList<ReviewStatus> selectReivewStatus(ReviewStatus review) {
		return objetDao.selectReivewStatus(review);
	}
	
	//한줄평 평가 체크
	public int selectRevGoodChk(ReviewStatus revstatus) {
		return objetDao.selectRevGoodChk(revstatus);
	}
	
	//한줄평 좋아요
	public int updateRevGood(ReviewStatus revstatus) {
		return objetDao.updateRevGood(revstatus);
	}

	//한줄평 좋아요 취소
	public int updateRevGoodReset(ReviewStatus revstatus) {
		return objetDao.updateRevGoodReset(revstatus);
	}

	//한줄평 싫어요
	public int updateRevHate(ReviewStatus revstatus) {
		return objetDao.updateRevHate(revstatus);
	}

	//한줄평 싫어요 취소
	public int updateRevHateReset(ReviewStatus revstatus) {
		return objetDao.updateRevHateReset(revstatus);
	}
	
	// 최민영 *******************************************************
	
	// 작가홈 오브제 리스트카운트
		@Override
		public int selectArtistObjetGetListCount(String userid) {
			return objetDao.selectArtistObjetGetListCount(userid);
		}

	// 작가홈 오브제 리스트 보기		
		@Override
		public List<Objet> selectArtistObjetList(HashMap<String, Object> map) {
			return objetDao.selectArtistObjetList(map);
		}
		
		
	// 작가홈 오브제 검색용 리스트카운트
		@Override
		public int selectArtistObjetSearchGetListCount(String objettitle) {
			return objetDao.selectArtistObjetSearchGetListCount(objettitle);
		}

		
	// 작가홈 오브제 검색
		@Override
		public List<Objet> selectArtistObjetSearch(HashMap<String, Object> map) {
			return objetDao.selectArtistObjetSearch(map);
		}
		
		
		
		
		
	
	// 오브제 관리-내 오브제 페이지 이동
	@Override
	public ArrayList<Objet> moveMyObjetList(String userid, Paging paging) {
		return objetDao.moveMyObjetList(userid, paging);
	}

	//오브제 관리-내 오브제 검색
	@Override
	public List<Objet> selectMyObjetSearch(HashMap<String, Object> map) {
		return objetDao.selectMyObjetSearch(map);
	}
	
	//오브제 관리 - 내 오브제 상세보기
	@Override
	public Objet moveMyObjetDetail(int objetno) {
		return objetDao.moveMyObjetDetail(objetno);
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
	public int insertObjet(Objet objet) {
		return objetDao.insertObjet(objet);
	}

	// 오브제 관리 - 전시 삭제
	@Override
	public int deleteObjet(int objetno) {
		return objetDao.deleteObjet(objetno);
	}

	

	

	

	




	

	
	
}
