package com.kh.objet.support.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;
import com.kh.objet.users.model.vo.Users;

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

	public String selectThanksmsg(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectThanksmsg", artistid);
	}

	public String selectartistnickname(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectartistnickname", artistid);
	}

	public int supportEnrollListCountm() {
		return mybatisSession.selectOne("supportMapper.supportEnrollListCountm");
	}

	public List<ApplySupport> supportEnrollListm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportEnrollListm", map);
	}

	public ApplySupport supportenrollListdetailm(String artistid) {
		return mybatisSession.selectOne("supportMapper.supportenrollListdetailm", artistid);
	}

	public int supportListCountm() {
		return mybatisSession.selectOne("supportMapper.supportListCountm");
	}

	public List<MySupport> supportListm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportListm", map);
	}

	public int supportRequestListCountm() {
		return mybatisSession.selectOne("supportMapper.supportRequestListCountm");
	}

	public List<RequestSupport> supportRequestm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportRequestm", map);
	}

	public RequestSupport requestSupportDetailm(int requestno) {
		return mybatisSession.selectOne("supportMapper.requestSupportDetailm", requestno);
	}

	public Users selectUser(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectUser", artistid);
	}

	public int updateRequestSupportDetailm(RequestSupport requestSupport) {
		return mybatisSession.update("supportMapper.updateRequestSupportDetailm", requestSupport);
	}

	public int supportEnrollSearchListCountm(String artistid) {
		return mybatisSession.selectOne("supportMapper.supportEnrollSearchListCountm", artistid);
	}

	public List<ApplySupport> supportEnrollSearchListm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportEnrollSearchListm", map);
	}

	public int supportSearchListCountm(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.supportSearchListCountm", map);
	}

	public List<MySupport> supportSearchListm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportSearchListm", map);
	}

	public int supportRequestSearchmListCountm(HashMap<String, Object> map) {
		return mybatisSession.selectOne("supportMapper.supportRequestSearchmListCountm", map);
	}

	public List<RequestSupport> supportRequestSearchm(HashMap<String, Object> map) {
		return mybatisSession.selectList("supportMapper.supportRequestSearchm", map);
	}

	public int selectCountSupporter(String artistid) {
		return mybatisSession.selectOne("supportMapper.selectCountSupporter", artistid);
	}


	

}
