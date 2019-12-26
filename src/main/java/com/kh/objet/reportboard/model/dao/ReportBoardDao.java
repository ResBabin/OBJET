package com.kh.objet.reportboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.reportboard.model.vo.ReportBoard;

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

	public ReportBoard selectReportBDetail(Map<String, String> map) {
		return mybatisSession.selectOne("adminMapper.selectReportBDetail", map);
	}

	public List<ReportBoard> selectReportAll() {
		return mybatisSession.selectList("adminMapper.selectReportAll");
	}
	
}
