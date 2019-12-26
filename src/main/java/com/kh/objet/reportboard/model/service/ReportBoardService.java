package com.kh.objet.reportboard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.objet.reportboard.model.vo.ReportBoard;

public interface ReportBoardService {
public List<ReportBoard> selectReportBList ();
public ReportBoard selectReportBDetail(Map<String, String> map);
public List<ReportBoard> selectReportAllList(ReportBoard report);
public List<ReportBoard> selectReportReason();
public List<ReportBoard> selectReportAll(); 
}    
