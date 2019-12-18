package com.kh.objet.notice.model.service;

import java.util.List;

import com.kh.objet.notice.model.vo.Notice;

public interface NoticeService {
	public List<Notice> selectNoticeList();
	public Notice selectNoticeDetail(int noticeno);

}
