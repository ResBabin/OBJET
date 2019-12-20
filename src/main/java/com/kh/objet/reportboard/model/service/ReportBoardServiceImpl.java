package com.kh.objet.reportboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.reportboard.model.dao.ReportBoardDao;
import com.kh.objet.reportboard.model.vo.ReportBoard;

@Service("reportbService")
public class ReportBoardServiceImpl implements ReportBoardService{

	@Autowired
	private ReportBoardDao reportbDao ;
	@Override
	public List<ReportBoard> selectReportBList() {
		return reportbDao.selectReportBList();
	}

	@Override
	public ReportBoard selectReportBDetail(String reportb) {
		return reportbDao.selectReportBDetail(reportb);
	}

}
