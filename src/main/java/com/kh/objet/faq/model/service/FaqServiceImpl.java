package com.kh.objet.faq.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.objet.faq.model.dao.FaqDao;

public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao faqDao;
}
