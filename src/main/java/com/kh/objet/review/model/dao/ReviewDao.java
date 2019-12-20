package com.kh.objet.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

@Repository("reviewDao")
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public ReviewDao() {}
	
	ArrayList<Review> selectReview(){
		List<Review> list = mybatisSession.selectList("objetMapper.selectReview");
		return (ArrayList<Review>)list;
	}
	
	int insertReview(Review review) {
		return mybatisSession.insert("objetMapper.insertReview", review);
	}
	
	int updateReview(Review review) {
		return mybatisSession.update("objetMapper.updateReview", review);
	}
	
	int deleteReview(String userid) {
		return mybatisSession.delete("objetMapper.deleteReview", userid);
	}
	
	int insertReviewReport(ReportBoard rb) {
		return mybatisSession.insert("objetMapper.insertReviewReport", rb);
	}
}
