package com.kh.objet.notice.model.service;


import java.util.List;

import com.kh.objet.notice.model.vo.Notice;
import com.kh.objet.notice.model.vo.SearchDate;

public interface NoticeService {
	public List<Notice> selectNoticeList();
	public Notice selectNoticeDetail(int noticeno);
	public List<Notice> selectNoticeListAsc();
	public int countNotice();
	public List<Notice>selectSearchNoticeTitle(String keyword);
	public List<Notice> selectSearchNoticeDate(SearchDate searchDate);

}
