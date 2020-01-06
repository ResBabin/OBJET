package com.kh.objet.qna.model.service;

import java.util.List;

import com.kh.objet.qna.model.vo.Qna;

public interface QnaService {
	public List<Qna> selectQnaList ();
	public Qna selectQnaDetail(int qnano);
	public int insertWriteQna(Qna qna);
	public List<Qna> selectQnaMain ();
}
