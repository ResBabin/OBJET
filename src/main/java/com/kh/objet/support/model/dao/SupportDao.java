package com.kh.objet.support.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;

@Repository("supportDao")
public class SupportDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public SupportDao() {}

	public ApplySupport selectSupport(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectSupport", artistid);
	}

	public int insertSupport(MySupport mysupport) {
		return mybatisSession.insert("supportMapper.insertSupport", mysupport);
	}

	public int insertApply(ApplySupport applysupport) {
		return mybatisSession.insert("supportMapper.insertApply", applysupport);
	}

	public ApplySupport moveModifySupport(String artistid) {
		return mybatisSession.selectOne("supportMapper.moveModifySupport", artistid);
	}

	public int updateApplySupport(ApplySupport applysupport) {
		return mybatisSession.update("supportMapper.updateApplySupport", applysupport);
	}
	

}
