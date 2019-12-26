package com.kh.objet.reportboard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public ReportBoard selectReportBDetail(Map<String, String> map) {
		return reportbDao.selectReportBDetail(map);
	}

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

}
