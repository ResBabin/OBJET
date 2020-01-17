package com.kh.objet.support.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.support.model.dao.SupportDao;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;

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
	public List<MySupport> selectRequestSupport(HashMap<String, Object> map) {
		return supportDao.selectRequestSupport(map);
	}
	
	@Override
	public RequestSupport moveRequestSupportDetail(HashMap<String, Object> map) {
		return supportDao.moveRequestSupportDetail(map);
	}
	
	

}
