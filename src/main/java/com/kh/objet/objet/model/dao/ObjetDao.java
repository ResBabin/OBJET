package com.kh.objet.objet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("objetDao")
public class ObjetDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public ObjetDao() {}
	
	//박예은
	
	//오브제 검색(전시/작가)
	public ArrayList<Artist> selectObjetAllSearch(String keyword) {
		List<Artist> list = mybatisSession.selectList("objetMapper.selectObjetAllSearch", keyword);
		return (ArrayList<Artist>)list;
	}

	//오브제 검색(전시/작가)
	public ArrayList<Artist> selectArtistAllSearch(String keyword) {
		List<Artist> list = mybatisSession.selectList("objetMapper.selectArtistAllSearch", keyword);
		return (ArrayList<Artist>)list;
	}
	
	//오브제 전시 전체 리스트
	public ArrayList<Objet> selectObjetAllList(){
		List<Objet> list = mybatisSession.selectList("objetMapper.selectObjetAll");
		return (ArrayList<Objet>)list;
	}

	public ArrayList<Artist> selectObjetMainList() {
		List<Artist> list = mybatisSession.selectList("objetMapper.selectObjetMain");
		return (ArrayList<Artist>)list;
	}
	
	//오브제 완전 전시 전체 리스트
	public ArrayList<Objet> selectAllObjetAllList() {
		List<Objet> list = mybatisSession.selectList("objetMapper.selectAllObjetAll");
		return (ArrayList<Objet>)list;
	}
	
	//오브제 작가 전체 리스트
	public ArrayList<Artist> selectArtistAllList(){
		List<Artist> list = mybatisSession.selectList("objetMapper.selectArtistAll");
		return (ArrayList<Artist>)list;
	}
	
	//오브제 작가 전체리스트 정렬
	public ArrayList<Artist> selectArtistListOrder(String order) {
		List<Artist> list = mybatisSession.selectList("objetMapper.selectArtistListOrder", order);
		return (ArrayList<Artist>)list;
	};
	
	//오브제 신고
	public int insertObjetReport(ReportBoard rb) {
		return mybatisSession.insert("objetMapper.insertObjetReport", rb);
	}
	
	//오브제 검색결과
	public ArrayList<Objet> selectObjetSearchList(String keyword){
		List<Objet> list = mybatisSession.selectList("objetMapper.objetSearchList", keyword);
		return (ArrayList<Objet>)list;
	}
	
	//오브제, 작가 상세보기, 한줄평 리스트, 내 한줄평, 관심오브제 카운트,리스트
	public Artist selectObjetOne(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectObjetOne", objetno);
	}
	
	//한줄평 신고
	public int insertReviewReport(ReportBoard rb) {
		return mybatisSession.insert("objetMapper.insertReviewReport", rb);
	}
	
	//한줄평 신고 체크
	public int selectReviewReport(ReportBoard rbb) {
		return mybatisSession.selectOne("objetMapper.selectReviewReport", rbb);
	}
	
	//한줄평 리스트
	public ArrayList<Review> selectReview(Review review) {
		List<Review> list = mybatisSession.selectList("objetMapper.selectReview", review);
		return (ArrayList<Review>)list;
	}

	//내 한줄평
	public Review selectReviewOne(ReviewKey rk) {
		return mybatisSession.selectOne("objetMapper.selectReviewOne", rk);
	}
	
	public Review selectReviewStatusOne(ReviewKey rk) {
		return mybatisSession.selectOne("objetMapper.selectReviewStatusOne", rk);
	}
	
	//한줄평 리스트 정렬
	public ArrayList<Review> selectReviewOrder(ReviewKey rk) {
		List<Review> list = mybatisSession.selectList("objetMapper.selectReviewOrder", rk);
		return (ArrayList<Review>)list;
	}
	
	//한줄평 추가
	public int insertReview(Review review) {
		return mybatisSession.insert("objetMapper.insertReview", review);
	}
	
	//한줄평 수정
	public int updateReview(Review review) {
		return mybatisSession.update("objetMapper.updateReview", review);
	}
	
	//한줄평 삭제
	public int deleteReview(Review review) {
		return mybatisSession.delete("objetMapper.deleteReview", review);
	}
	
	//관심오브제 추가
	public int insertLikeObjet(LikeObjet likeobjet) {
		return mybatisSession.insert("objetMapper.insertLikeObjet", likeobjet);
	}

	//관심오브제 삭제
	public int deleteLikeObjet(LikeObjet likeobjet) {
		return mybatisSession.delete("objetMapper.deleteLikeObjet", likeobjet);
	}
	
	//관심오브제 리스트
	public ArrayList<LikeObjet> selectLikeObjet(int objetno) {
		List<LikeObjet> list = mybatisSession.selectList("objetMapper.selectLikeObjet", objetno);
		return (ArrayList<LikeObjet>)list;
	}
	
	//관심오브제 카운트
	public int selectLikeObjetOne(LikeObjet likeobjet) {
		return mybatisSession.selectOne("objetMapper.selectLikeObjetOne", likeobjet);
	}
	
	//한줄평 좋아요 체크
	public int selectRevGoodChk(ReviewStatus revstatus) {
		return mybatisSession.selectOne("objetMapper.selectRevGoodChk",revstatus);
	}
	
	//한줄평 싫어요 체크
	public int selectRevHateChk(ReviewStatus revstatus) {
		return mybatisSession.selectOne("objetMapper.selectRevHateChk",revstatus);
	}
	
	//한줄평 좋아요
	public int insertRevGood(ReviewStatus revstatus) {
		return mybatisSession.insert("objetMapper.insertRevGood", revstatus);
	}

	//한줄평 좋아요 취소
	public int deleteRevGood(ReviewStatus revstatus) {
		return mybatisSession.delete("objetMapper.deleteRevGood", revstatus);
	}

	//한줄평 싫어요
	public int insertRevHate(ReviewStatus revstatus) {
		return mybatisSession.insert("objetMapper.insertRevHate", revstatus);
	}

	//한줄평 싫어요 취소
	public int deleteRevHate(ReviewStatus revstatus) {
		return mybatisSession.delete("objetMapper.deleteRevHate", revstatus);
	}
	
	public int selectLikeObjetCnt(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectLikeObjetCnt", objetno);
	}

	public int selectReviewCnt(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectReviewCnt", objetno);
	}
	
	public List<Objet> selectArtistObjetStatus(String userid) {
		return mybatisSession.selectList("objetMapper.selectArtistObjetStatus", userid);
	}
	
	public int selectFollowingCnt(String userid) {
		return mybatisSession.selectOne("objetMapper.selectFollowingCnt", userid);
	}
	
	public List<ReviewStatus> selectReviewStatusChk(ReviewKey rk) {
		return mybatisSession.selectList("objetMapper.selectReviewStatusChk", rk);
	}
	
	//다녀온 오브제 추가
	public int insertVisitedObjet(VisitedObjet vs) {
		return mybatisSession.insert("objetMapper.insertVisitedObjet", vs);
	}
	
	public int selectVisitedObjet(VisitedObjet vs) {
		return mybatisSession.selectOne("objetMapper.selectVisitedObjet", vs);
	}

	//관심오브제 캘린더
	public List<LikeObjet> selectLikeObjetCalendar(String userid) {
		return mybatisSession.selectList("objetMapper.selectLikeObjetCalendar", userid);
	}
	
	//다녀온 오브제 캘린더
	public List<VisitedObjet> selectVisitedObjetCalendar(String userid) {
		return mybatisSession.selectList("objetMapper.selectVisitedObjetCalendar", userid);
	}
	
	//전시일정
	public List<Objet> selectObjetCalendar(int objetno) {
		return mybatisSession.selectList("objetMapper.selectObjetCalendar", objetno);
	}
	
	
	// 최민영
	// 작가홈 오브제 리스트 보기
	public List<Objet2> selectArtistObjetList(String userid) {
		return mybatisSession.selectList("objetMapper.selectArtistObjetList",userid);
	}

	// 작가홈 오브제 검색용 리스트카운트
	public int selectArtistObjetSearchGetListCount(String objettitle) {
		return mybatisSession.selectOne("", objettitle);
	}

	// 작가홈 오브제 검색
	public List<Objet2> selectArtistObjetSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("objetMapper.selectArtistObjetSearch",map);
	}
	

	// 관심수 가져오기
	public int selectlikecount(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectlikecount", objetno);
	}
	

	// 리뷰 수 가져오기
	public int selectreviewcount(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectreviewcount", objetno);
	}

	public int selectObjetCnt(String userid) {
		return mybatisSession.selectOne("objetMapper.selectObjetCnt", userid);
	}

	public int selectFollowerCnt(String userid) {
		return mybatisSession.selectOne("objetMapper.selectFollowerCnt", userid);
	}
	
	
	//박근수
	// 오브제 관리-내 오브제 페이지 이동
	public ArrayList<Objet> moveMyObjetList(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Objet> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<Objet>) list;
	}

	//오브제 관리-내 오브제 검색
	public List<Objet2> selectMyObjetSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("objetMapper.selectMyObjetSearch", map);
	}

	//오브제 관리 - 내 오브제 상세보기 이동
	public Objet moveMyObjetDetail(String objettitle) {
		return mybatisSession.selectOne("objetMapper.moveMyObjetDetail", objettitle);
	}

	//오브제 관리 - 내 오브제 수정 페이지 이동
	public Objet moveEditObjet(int objetno) {
		return mybatisSession.selectOne("objetMapper.moveEditObjet", objetno);
	}

	//오브제 관리 - 내 오브제 수정
	public int updateMyObjet(Objet objet) {
		return mybatisSession.update("objetMapper.updateMyObjet", objet);
	}

	//오브제 관리 - 전시 등록
	public int insertObjet(Objet3 objet3) {
		return mybatisSession.insert("objetMapper.insertObjet", objet3);
	}

	// 오브제 관리 - 전시삭제
	public int deleteObjet(int objetno) {
		return mybatisSession.delete("objetMapper.deleteObjet", objetno);
	}

	



	

	
	

	

	

	

	

	

	

	
	



	





	


	


	


	


	

	

	
	

	
	
}
