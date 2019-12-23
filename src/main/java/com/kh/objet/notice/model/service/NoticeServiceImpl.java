package com.kh.objet.notice.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.notice.model.dao.NoticeDao;
import com.kh.objet.notice.model.vo.Notice;
import com.kh.objet.notice.model.vo.SearchDate;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public Notice selectNoticeDetail(int noticeno) {
		return noticeDao.selectNoticeDetail(noticeno);
	}

	@Override
	public List<Notice> selectNoticeListAsc() {
		return noticeDao.selectNoticeListAsc();
	}
	@Override
	public int countNotice() {
		return noticeDao.countNotice();
	}

	@Override
	public List<Notice> selectSearchNoticeTitle(String keyword){
		return noticeDao.selectSearchNoticeTitle(keyword);
	}

	@Override
	public List<Notice> selectSearchNoticeDate(SearchDate searchDate) {
		return noticeDao.selectSearchNoticeDate(searchDate);
	}

	

}
