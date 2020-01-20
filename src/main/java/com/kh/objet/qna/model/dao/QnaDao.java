package com.kh.objet.qna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.qna.model.vo.Qna;

@Repository("qnaDao")
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public QnaDao() {}
	
	/////////////////////////////////이유진/////////////////////////////////////////////////////

	   public List<Qna> selectQnaList(HashMap<String,Object> map){
	      return mybatisSession.selectList("csMapper.selectQnaList",map);
	   }
	   
	   public int insertWriteQna(Qna qna) {
	      return mybatisSession.insert("csMapper.insertQnaWrite",qna);
	   }
	   public int listCount2() {
	      return mybatisSession.selectOne("csMapper.listCount2");
	   }

	   public int qnaSearchListCount(HashMap<String, Object> mapp) {
	      
	      return mybatisSession.selectOne("csMapper.qnaSearchListCount",mapp);
	   }

	   public List<Qna> selectQnaSearchList(HashMap<String, Object> map) {
	      
	      return mybatisSession.selectList("csMapper.selectQnaSearchList",map);
	   }

	   public int insertQna(Qna qna) {
	      return mybatisSession.insert("csMapper.insertQna",qna);
	   }

	   public Qna selectQnaDetail(int qnano) {
	      return mybatisSession.selectOne("csMapper.selectQnaDetail", qnano);
	      
	   }
	   
	   public int deleteQna(int qnano) {
	      return mybatisSession.delete("csMapper.deleteQna", qnano);
	   }
	   
	   public int deleteQna1(int qnano) {
		      return mybatisSession.delete("csMapper.deleteQna1", qnano);
		   }
	   
	   public int updateQna(Qna qna) {
	      return mybatisSession.update("csMapper.updateQna", qna);
	   }

	public List<Qna> selectQnaListAdmin() {
		return mybatisSession.selectList("adminMapper.selectQnaList");
	}
	
	public List<Qna> selectQnaListAdmin(Map<String, String> map) {
	      return mybatisSession.selectList("adminMapper.selectQnaListAd", map); 
	   }

	   public int selectQnaCountAd(Map<String, String> map) {
	      return mybatisSession.selectOne("adminMapper.selectQnaCountAd", map);
	   }

	   public List<Qna> selectQnaListAdmin5() {
	      return mybatisSession.selectList("adminMapper.selectQnaListAdmin5");
	   }

	   public Qna selectQnaDetailAdmin(int qnano) {
	      return mybatisSession.selectOne("adminMapper.selectQnaDetail", qnano);
	   }

	   public int updateQnaAnswer(Qna qna) {
	      return mybatisSession.update("adminMapper.updateQnaAnswer", qna);
	   }

	   public int selectQnaCountAd() {
	      return mybatisSession.selectOne("adminMapper.selectQnaCountAd");
	   }

	   public int selectQnaCountAnswer() {
	      return mybatisSession.selectOne("adminMapper.selectQnaCountAnswer");
	   }

	
}
