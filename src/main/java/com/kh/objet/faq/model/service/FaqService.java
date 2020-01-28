 package com.kh.objet.faq.model.service;

import java.util.List;
import java.util.Map;

import com.kh.objet.faq.model.vo.Faq;

public interface FaqService {
	public List<Faq> selectFaqList();
	public Faq selectFaqDetail(int faqno);
	public List<Faq> selectFaqListAd(Map<String, String> map);
	   public int selectFaqCountAd();
	public int insertFaqAd(Faq faq);
	public int deleteFaqAd(String faqno);
	public int updateFaqAd(Faq faq);
}
