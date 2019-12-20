package com.kh.objet.review.model.service;

import java.util.ArrayList;

import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

public interface ReviewService {
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(String userid);
	int insertReviewReport(ReportBoard rb);
	ArrayList<Review> selectReview();
	
}
