package com.kh.objet.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.faq.model.dao.FaqDao;
import com.kh.objet.faq.model.vo.Faq;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao faqDao;

	@Override
	public List<Faq> selectFaqList() {
		return faqDao.selectFaqList();
	}

	@Override
	public Faq selectFaqDetail(int faqno) {
		return faqDao.selectFaqDetail(faqno);
	}
}
