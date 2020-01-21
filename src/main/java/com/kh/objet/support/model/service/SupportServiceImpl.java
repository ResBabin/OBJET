package com.kh.objet.support.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.support.model.dao.SupportDao;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;
import com.kh.objet.users.model.vo.Users;

@Service("supportService")
public class SupportServiceImpl implements SupportService{
	
	@Autowired
	private SupportDao supportDao;

	@Override
	public ApplySupport selectSupport(String artistid) {
		return supportDao.selectSupport(artistid);
	}

	@Override
	public int insertSupport(MySupport mysupport) {
		return supportDao.insertSupport(mysupport);
	}
	@Override
	public int insertApply(ApplySupport applysupport) {
		return supportDao.insertApply(applysupport);
	}
	
	@Override
	public ApplySupport moveModifySupport(String artistid) {
		return supportDao.moveModifySupport(artistid);
	}

	@Override
	public int updateApplySupport(ApplySupport applysupport) {
		return supportDao.updateApplySupport(applysupport);
	}

	@Override
	public int deleteApplySupport(String artistid) {
		return supportDao.deleteApplySupport(artistid);
	}

	@Override
	public int selectSendSupportListCount(String sptid) {
		return supportDao.selectSendSupportListCount(sptid);
	}

	@Override
	public List<MySupport> selectSendSupport(HashMap<String, Object> map) {
		return supportDao.selectSendSupport(map);
	}

	@Override
	public int selectSendSupportSearchListCount(HashMap<String, Object> map) {
		return supportDao.selectSendSupportSearchListCount(map);
	}

	@Override
	public List<MySupport> selectSendSupportSearch(HashMap<String, Object> map) {
		return supportDao.selectSendSupportSearch(map);
	}

	@Override
	public int selectReceiveSupportListCount(String artistid) {
		return supportDao.selectReceiveSupportListCount(artistid);
	}

	@Override
	public List<MySupport> selectReceiveSupport(HashMap<String, Object> map) {
		return supportDao.selectReceiveSupport(map);
	}

	@Override
	public int selectReceiveSupportSearchListCount(HashMap<String, Object> map) {
		return supportDao.selectReceiveSupportSearchListCount(map);
	}

	@Override
	public List<MySupport> selectReceiveSupportSearch(HashMap<String, Object> map) {
		return supportDao.selectReceiveSupportSearch(map);
	}

	@Override
	public int selectRequestSupportListCount(String artistid) {
		return supportDao.selectRequestSupportListCount(artistid);
	}

	@Override
	public List<RequestSupport> selectRequestSupport(HashMap<String, Object> map) {
		return supportDao.selectRequestSupport(map);
	}
	
	@Override
	public RequestSupport moveRequestSupportDetail(HashMap<String, Object> map) {
		return supportDao.moveRequestSupportDetail(map);
	}

	@Override
	public int selectInsertRequestSupportyn(String artistid) {
		return supportDao.selectInsertRequestSupportyn(artistid);
	}

	@Override
	public int selectInsertRequestSupport(RequestSupport requestsupport) {
		return supportDao.selectInsertRequestSupport(requestsupport);
	}

	@Override
	public int selectRequestSupportSearchListCount(HashMap<String, Object> map) {
		return supportDao.selectRequestSupportSearchListCount(map);
	}

	@Override
	public List<RequestSupport> selectRequestSupportSearch(HashMap<String, Object> map) {
		return supportDao.selectRequestSupportSearch(map);
	}

	@Override
	public int deleteRequestSupport(int requestno) {
		return supportDao.deleteRequestSupport(requestno);
	}

	@Override
	public int selectCountArtist() {
		return supportDao.selectCountArtist();
	}

	@Override
	public int selectCountSupport() {
		return supportDao.selectCountSupport();
	}

	@Override
	public String selectThanksmsg(String artistid) {
		return supportDao.selectThanksmsg(artistid);
	}

	@Override
	public String selectartistnickname(String artistid) {
		return supportDao.selectartistnickname(artistid);
	}
	
	@Override
	public int supportEnrollListCountm() {
		return supportDao.supportEnrollListCountm();
	}

	@Override
	public List<ApplySupport> supportEnrollListm(HashMap<String, Object> map) {
		return supportDao.supportEnrollListm(map);
	}

	@Override
	public ApplySupport supportenrollListdetailm(String artistid) {
		return supportDao.supportenrollListdetailm(artistid);
	}

	@Override
	public int supportListCountm() {
		return supportDao.supportListCountm();
	}

	@Override
	public List<MySupport> supportListm(HashMap<String, Object> map) {
		return supportDao.supportListm(map);
	}

	@Override
	public int supportRequestListCountm() {
		return supportDao.supportRequestListCountm();
	}

	@Override
	public List<RequestSupport> supportRequestm(HashMap<String, Object> map) {
		return supportDao.supportRequestm(map);
	}

	@Override
	public RequestSupport requestSupportDetailm(int requestno) {
		return supportDao.requestSupportDetailm(requestno);
	}

	@Override
	public Users selectUser(String artistid) {
		return supportDao.selectUser(artistid);
	}

	@Override
	public int updateRequestSupportDetailm(RequestSupport requestSupport) {
		return supportDao.updateRequestSupportDetailm(requestSupport);
	}

	@Override
	public int supportEnrollSearchListCountm(String artistid) {
		return supportDao.supportEnrollSearchListCountm(artistid);
	}

	@Override
	public List<ApplySupport> supportEnrollSearchListm(HashMap<String, Object> map) {
		return supportDao.supportEnrollSearchListm(map);
	}

	@Override
	public int supportSearchListCountm(HashMap<String, Object> map) {
		return supportDao.supportSearchListCountm(map);
	}

	@Override
	public List<MySupport> supportSearchListm(HashMap<String, Object> map) {
		return supportDao.supportSearchListm(map);
	}

	@Override
	public int supportRequestSearchmListCountm(HashMap<String, Object> map) {
		return supportDao.supportRequestSearchmListCountm(map);
	}

	@Override
	public List<RequestSupport> supportRequestSearchm(HashMap<String, Object> map) {
		return supportDao.supportRequestSearchm(map);
	}

	


	

}
