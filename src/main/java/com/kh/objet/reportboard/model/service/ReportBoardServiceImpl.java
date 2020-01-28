package com.kh.objet.reportboard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.reportboard.model.dao.ReportBoardDao;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.kh.objet.review.model.vo.Review;

@Service("reportbService")
public class ReportBoardServiceImpl implements ReportBoardService{

	@Autowired
	private ReportBoardDao reportbDao ;
/*	@Override
	public List<ReportBoard> selectReportBList() {
		return reportbDao.selectReportBList();
	}

	@Override
	public List<ReportBoard> selectReportBDetail() {
		return reportbDao.selectReportBDetail();
	}*/

	@Override
	public List<ReportBoard> selectReportAllList(ReportBoard report) {
		return reportbDao.selectReportAllList(report);
	}

	@Override
	public List<ReportBoard> selectReportReason() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportBoard> selectReportAll() {
		return reportbDao.selectReportAll();
	}

	@Override
	public int deleteReportbOrigin(ReportBoard reportb) {
		return reportbDao.deleteReportbOrigin(reportb);
	}

	@Override
	public int deleteReportb(ReportBoard reportb) {
		return reportbDao.deleteReportb(reportb);
	}

/*	@Override
	public Review selectReportDetail(Review review) {
		return reportbDao.selectReportDetail(review);
	}
*/
	@Override
	public List<ReportBoard> selectReportCount() {
		return reportbDao.selectReportCount();
	}

	@Override
	public List<ReportBoard> selectReportMain() {
		return reportbDao.selectReportMain();
	}

	@Override
	public int selectReportObjetList() {
		return reportbDao.selectReportObjetList();
	}

	@Override
	public List<ReportBoard> selectReportObjet() {
		return reportbDao.selectReportObjet();
	}

	@Override
	public int selectReportReviewList() {
		return reportbDao.selectReportReviewList();
	}

	@Override
	public List<ReportBoard> selectReportReview() {
		return reportbDao.selectReportReview();
	}

	@Override
	public List<ReportBoard> selectReportObjetDetail() {
		return reportbDao.selectReportObjetDetail();
	}

	@Override
	public List<ReportBoard> selectReportReviewDetail() {
		return reportbDao.selectReportReviewDetail();
	}
	

}
