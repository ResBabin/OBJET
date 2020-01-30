package com.kh.objet.faq.model.dao;

import java.util.List;
import java.util.Map;

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
	///////////////////////////이유진//////////////////////////////////////////////////////////////////
	//자주묻는 질문 전체목록
	public List<Faq> selectFaqList() {
		return mybatisSession.selectList("csMapper.selectFaqList");
	}
///////////////////////////////////////////////관리자///////////////////////////////////////////////
public List<Faq> selectFaqListAd(Map<String, String> map) {
return mybatisSession.selectList("adminMapper.selectFaqList", map);
}
  
public Faq selectFaqDetail(int faqno) {
return mybatisSession.selectOne("adminMapper.selectFaqDetail", faqno);
}
public int selectFaqCountAd() {
return mybatisSession.selectOne("adminMapper.selectFaqCountAd");
}
public int insertFaqAd(Faq faq) {
	return mybatisSession.insert("adminMapper.insertFaqAd", faq);
}
public int deleteFaqAd(String faqno) {
	return mybatisSession.delete("adminMapper.deleteFaqAd", faqno);
}
public int updateFaqAd(Faq faq) {
	return mybatisSession.update("adminMapper.updateFaqAd", faq);
}
	

}
