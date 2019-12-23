package com.kh.objet.qna.model.dao;

import java.util.List;

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
	public int insertWriteQna(Qna qna) {
		return mybatisSession.insert("csMapper.insertQnaWrite",qna);
	}
      ////////////////////////////////////////관리자/////////////////////////////////////////////////
	public List<Qna> selectQnaList(){
		return mybatisSession.selectList("adminMapper.selectQnaList");
	}
	public Qna selectQnaDetail(int qnano) {
		return mybatisSession.selectOne("adminMapper.selectQnaDetail", qnano);
	}

	
}
