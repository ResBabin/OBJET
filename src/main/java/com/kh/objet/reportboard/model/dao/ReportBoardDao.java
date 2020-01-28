package com.kh.objet.reportboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

@Repository("reportbDao")
public class ReportBoardDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;

	public ReportBoardDao() {
	}

	public List<ReportBoard> selectReportBList() {
		return mybatisSession.selectList("adminMapper.selectReportBList"); 
	}
	public List<ReportBoard> selectReportAllList(ReportBoard report) {
		return mybatisSession.selectList("adminMapper.selectReportAllList", report); 
	}

	public List<ReportBoard> selectReportReason() {
		return mybatisSession.selectList("adminMapper.selectReportReason"); 
	}

	public List<ReportBoard> selectReportBDetail() {
		return mybatisSession.selectList("adminMapper.selectReportBDetail");
	}
	
	public Review selectReportDetail(Review review) {
		return mybatisSession.selectOne("adminMapper.selectReportDetail", review);
	}

	public List<ReportBoard> selectReportAll() {
		return mybatisSession.selectList("adminMapper.selectReportAll");
	}

	public int deleteReportbOrigin(ReportBoard reportb) {
		return mybatisSession.delete("adminMapper.deleteReportbOrigin", reportb);
	}
	
	public int deleteReportb(ReportBoard reportb) {
		return mybatisSession.delete("adminMapper.deleteReportb", reportb);
	}

	public List<ReportBoard> selectReportCount() {
		return mybatisSession.selectList("adminMapper.selectReportCount");
	}
	public List<ReportBoard> selectReportMain() {
		return mybatisSession.selectList("adminMapper.selectReportMain");
	}

	public int selectReportObjetList() {
		return mybatisSession.selectOne("adminMapper.selectReportObjetList");
	}

	public List<ReportBoard> selectReportObjet() {
		return mybatisSession.selectList("adminMapper.selectReportObjet");
	}

	public int selectReportReviewList() {
		return mybatisSession.selectOne("adminMapper.selectReportReviewList");
	}

	public List<ReportBoard> selectReportReview() {
		return mybatisSession.selectList("adminMapper.selectReportReview");
	}

	public List<ReportBoard> selectReportObjetDetail() {
		return mybatisSession.selectList("adminMapper.selectReportObjetDetail");
	}

	public List<ReportBoard> selectReportReviewDetail() {
		return mybatisSession.selectList("adminMapper.selectReportReviewDetail");
	}
	
}
