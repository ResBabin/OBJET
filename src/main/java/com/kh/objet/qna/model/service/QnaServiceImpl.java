package com.kh.objet.qna.model.service;

import java.util.HashMap;
import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna selectQnaDetailAdmin(int qnano) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertWriteQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> selectQnaMain() {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteQna(int qnano) {
		// TODO Auto-generated method stub
		return 0;
	}

}
