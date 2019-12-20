package com.kh.objet.reportboard.model.service;

import java.util.List;

import com.kh.objet.reportboard.model.vo.ReportBoard;

public interface ReportBoardService {
public List<ReportBoard> selectReportBList ();
public ReportBoard selectReportBDetail(String reportbtype);
}
