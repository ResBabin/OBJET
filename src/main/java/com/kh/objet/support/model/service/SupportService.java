package com.kh.objet.support.model.service;

import com.kh.objet.support.model.vo.ApplySupport;
import com.kh.objet.support.model.vo.MySupport;

public interface SupportService {
	
	ApplySupport selectSupport(String artistid);
	int insertSupport(MySupport mysupport);
	int insertApply(ApplySupport applysupport);
	ApplySupport moveModifySupport(String artistid);
	int updateApplySupport(ApplySupport applysupport);

}
