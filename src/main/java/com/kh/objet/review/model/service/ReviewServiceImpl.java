package com.kh.objet.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.dao.ReviewDao;
import com.kh.objet.review.model.vo.Review;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;

	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReviewReport(ReportBoard rb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Review> selectReview() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
