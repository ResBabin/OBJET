 package com.kh.objet.faq.model.service;

import java.util.List;

import com.kh.objet.faq.model.vo.Faq;

public interface FaqService {
	public List<Faq> selectFaqList();
	public Faq selectFaqDetail(int faqno);
}
