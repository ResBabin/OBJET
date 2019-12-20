package com.kh.objet.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.review.model.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	private ReviewServiceImpl reviewService;
	
	public ReviewController() {}
	
	//한줄평 리스트
	@RequestMapping("reviewList.do")
	public String selectReview() {
		return "objet/objetReview";
	}









}
