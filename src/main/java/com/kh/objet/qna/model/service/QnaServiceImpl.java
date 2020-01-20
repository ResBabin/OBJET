package com.kh.objet.qna.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.qna.model.dao.QnaDao;
import com.kh.objet.qna.model.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
/////////////////////////이유진/////////////////////////////////////

	@Override
	public List<Qna> selectQnaList(HashMap<String, Object> map) {
		return qnaDao.selectQnaList(map);
	}

	public int listCount2() {
		return qnaDao.listCount2();
	}

	@Override
	public Qna selectQnaDetail(int qnano) {
		return qnaDao.selectQnaDetail(qnano);
	}

	@Override
	public int qnaSearchListCount(HashMap<String, Object> mapp) {

		return qnaDao.qnaSearchListCount(mapp);
	}

	@Override
	public List<Qna> selectQnaSearchList(HashMap<String, Object> map) {

		return qnaDao.selectQnaSearchList(map);
	}

	@Override
	public int insertQna(Qna qna) {

		return qnaDao.insertQna(qna);
	}

	@Override
	public List<Qna> selectQnaListAdmin() {
		return qnaDao.selectQnaListAdmin();
	}

	@Override
	public Qna selectQnaDetailAdmin(int qnano) {
		return qnaDao.selectQnaDetailAdmin(qnano);
	}

	
	public int deleteQna(int qnano) {
		return qnaDao.deleteQna(qnano);
	}

	public int deleteQna1(int qnano) {
		return qnaDao.deleteQna(qnano);
	}


	@Override
	public int updateQna(Qna qna) {
	 return qnaDao.updateQna(qna);
	}


	

	   @Override
	   public List<Qna> selectQnaListAdmin(Map<String, String> map) {
	      return qnaDao.selectQnaListAdmin(map);
	   }

   public int selectQnaCountAd(Map<String, String> map) {
	      return qnaDao.selectQnaCountAd(map);
	   }

	   @Override
	   public List<Qna> selectQnaListAdmin5() {
	      return qnaDao.selectQnaListAdmin5();
	   }

	   @Override
	   public int updateQnaAnswer(Qna qna) {
	      return qnaDao.updateQnaAnswer(qna);
	   }

	   @Override
	   public int selectQnaCountAd() {
	      return qnaDao.selectQnaCountAd();
	   }

	   @Override
	   public int selectQnaCountAnswer() {
	      return qnaDao.selectQnaCountAnswer();
	   }

}
