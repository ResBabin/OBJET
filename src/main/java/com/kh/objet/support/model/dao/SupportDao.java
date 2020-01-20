package com.kh.objet.support.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;

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

	public int deleteApplySupport(String artistid) {
		return mybatisSession.delete("supportMapper.deleteApplySupport", artistid);
	}

	public int selectSendSupportListCount(String sptid) {
		return mybatisSession.selectOne("supportMapper.selectSendSupportListCount", sptid);
	}

	public List<MySupport> selectSendSupport(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectSendSupport", map);
	}

	public int selectSendSupportSearchListCount(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.selectSendSupportSearchListCount",map);
	}

	public List<MySupport> selectSendSupportSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectSendSupportSearch", map);
	}

	public int selectReceiveSupportListCount(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectReceiveSupportListCount",artistid);
	}

	public List<MySupport> selectReceiveSupport(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectReceiveSupport", map);
	}

	public int selectReceiveSupportSearchListCount(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.selectReceiveSupportSearchListCount", map);
	}

	public List<MySupport> selectReceiveSupportSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectReceiveSupportSearch", map);
	}

	public int selectRequestSupportListCount(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectRequestSupportListCount", artistid);
	}

	public List<RequestSupport> selectRequestSupport(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectRequestSupport", map);
	}

	public RequestSupport moveRequestSupportDetail(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.moveRequestSupportDetail", map);
	}

	public int selectInsertRequestSupportyn(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectInsertRequestSupportyn", artistid);
	}

	public int selectInsertRequestSupport(RequestSupport requestsupport) {
		return mybatisSession.insert("supportMapper.selectInsertRequestSupport", requestsupport);
	}

	public int selectRequestSupportSearchListCount(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.selectRequestSupportSearchListCount", map);
	}

	public List<RequestSupport> selectRequestSupportSearch(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.selectRequestSupportSearch", map);
	}

	public int deleteRequestSupport(int requestno) {
		return mybatisSession.delete("supportMapper.deleteRequestSupport", requestno);
	}

	public int selectCountArtist() {
		return mybatisSession.selectOne("supportMapper.selectCountArtist");
	}

	public int selectCountSupport() {
		return mybatisSession.selectOne("supportMapper.selectCountSupport");
	}

	

}
