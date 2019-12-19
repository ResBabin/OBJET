package com.kh.objet.faq.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.faq.model.vo.Faq;

import oracle.net.aso.f;

@Repository("faqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public FaqDao() {}

	public List<Faq> selectFaqList() {
		return mybatisSession.selectList("adminMapper.selectFaqList");
	}

	public Faq selectFaqDetail(int faqno) {
		return mybatisSession.selectOne("adminMapper.selectFaqDetail", faqno);
	}

}
