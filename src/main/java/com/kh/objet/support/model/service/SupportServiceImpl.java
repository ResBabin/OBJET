package com.kh.objet.support.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.support.model.dao.SupportDao;
import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;

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
	
	

}
