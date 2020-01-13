package com.kh.objet.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.objet.notice.model.vo.Notice;
import com.kh.objet.notice.model.vo.SearchDate;

public interface NoticeService {
	List<Notice> selectNoticeList(HashMap<String, Object> map);

	public List<Notice> selectNoticeListAsc();

	public int getListCount();

	public Notice selectNoticeDetail(int noticeno);

	public int noticeSearchListCount(HashMap<String, Object> mapp);

	public List<Notice> selectNoticeSearchList(HashMap<String, Object> map);

	public int insertNotice(Notice notice);

	public int updateNotice(Notice notice);

	public int deleteNotice(int noticeno);

	public int deleteFile(Notice notice);

	public ArrayList<Notice> selectNoticeListAd();

}