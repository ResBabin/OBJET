package com.kh.objet.notice.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.objet.notice.model.dao.NoticeDao;

public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;

}
