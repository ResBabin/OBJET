package com.kh.objet.guestbook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.guestbook.model.dao.GuestBookDao;

@Service("guestbookService")
public class GuestBookServiceImpl implements GuestBookService{

	@Autowired
	private GuestBookDao guestBookDao;
}
