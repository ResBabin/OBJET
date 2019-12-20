package com.kh.objet.guestbook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("guestbookDao")
public class GuestBookDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public GuestBookDao() {}
}
