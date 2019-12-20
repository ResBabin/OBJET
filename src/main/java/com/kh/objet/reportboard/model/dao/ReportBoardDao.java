package com.kh.objet.reportboard.model.dao;

import java.util.List;

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

	public ReportBoard selectReportBDetail(String reportb) {
		return mybatisSession.selectOne("adminMapper.selectReportBDetail", reportb);
	}

}
