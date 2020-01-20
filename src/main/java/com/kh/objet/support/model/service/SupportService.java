package com.kh.objet.support.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;

public interface SupportService {
	
	ApplySupport selectSupport(String artistid);
	int insertSupport(MySupport mysupport);
	int insertApply(ApplySupport applysupport);
	ApplySupport moveModifySupport(String artistid);
	int updateApplySupport(ApplySupport applysupport);
	int deleteApplySupport(String artistid);
	int selectSendSupportListCount(String sptid);
	List<MySupport> selectSendSupport(HashMap<String, Object> map);
	int selectSendSupportSearchListCount(HashMap<String, Object> map);
	List<MySupport> selectSendSupportSearch(HashMap<String, Object> map);
	int selectReceiveSupportListCount(String artistid);
	List<MySupport> selectReceiveSupport(HashMap<String, Object> map);
	int selectReceiveSupportSearchListCount(HashMap<String, Object> map);
	List<MySupport> selectReceiveSupportSearch(HashMap<String, Object> map);
	int selectRequestSupportListCount(String artistid);
	List<RequestSupport> selectRequestSupport(HashMap<String, Object> map);
	RequestSupport moveRequestSupportDetail(HashMap<String, Object> map);
	int selectInsertRequestSupportyn(String artistid);
	int selectInsertRequestSupport(RequestSupport requestsupport);
	int selectRequestSupportSearchListCount(HashMap<String, Object> map);
	List<RequestSupport> selectRequestSupportSearch(HashMap<String, Object> map);
	int deleteRequestSupport(int requestno);
	int selectCountArtist();
	int selectCountSupport();
}
