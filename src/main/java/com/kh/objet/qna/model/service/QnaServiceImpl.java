package com.kh.objet.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.qna.model.dao.QnaDao;
import com.kh.objet.qna.model.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao qnaDao;
	
	/////////////////////////이유진/////////////////////////////////////
	@Override
	public int insertWriteQna(Qna qna) {
		return qnaDao.insertWriteQna(qna);
	}
	////////////////////////////////관리자/////////////////////////////////////

	@Override
	public List<Qna> selectQnaList() {
		return qnaDao.selectQnaList();
	}

	@Override
	public Qna selectQnaDetail(int qnano) {
		return qnaDao.selectQnaDetail(qnano);
	}

	@Override
	public List<Qna> selectQnaMain() {
		return qnaDao.selectQnaMain();
	}

	
	
}
