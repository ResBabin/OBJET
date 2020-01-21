package com.kh.objet.support.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;
import com.kh.objet.support.model.vo.RequestSupport;
import com.kh.objet.users.model.vo.Users;

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
	String selectThanksmsg(String artistid);
	String selectartistnickname(String artistid);
	int supportEnrollListCountm();
	List<ApplySupport> supportEnrollListm(HashMap<String, Object> map);
	ApplySupport supportenrollListdetailm(String artistid);
	int supportListCountm();
	List<MySupport> supportListm(HashMap<String, Object> map);
	int supportRequestListCountm();
	List<RequestSupport> supportRequestm(HashMap<String, Object> map);
	RequestSupport requestSupportDetailm(int requestno);
	Users selectUser(String artistid);
	int updateRequestSupportDetailm(RequestSupport requestSupport);
	int supportEnrollSearchListCountm(String artistid);
	List<ApplySupport> supportEnrollSearchListm(HashMap<String, Object> map);
	int supportSearchListCountm(HashMap<String, Object> map);
	List<MySupport> supportSearchListm(HashMap<String, Object> map);
	int supportRequestSearchmListCountm(HashMap<String, Object> map);
	List<RequestSupport> supportRequestSearchm(HashMap<String, Object> map);
}
