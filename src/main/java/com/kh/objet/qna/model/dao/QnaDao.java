package com.kh.objet.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaDao")
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public QnaDao() {}

}
