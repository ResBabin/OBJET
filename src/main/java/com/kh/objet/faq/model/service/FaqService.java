 package com.kh.objet.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.objet.faq.model.vo.Faq;

public interface FaqService {
	public List<Faq> selectFaqList();
	public Faq selectFaqDetail(int faqno);
	public List<Faq> selectFaqListAd(Map<String, Integer> map);
	   public int selectFaqCountAd();
}
