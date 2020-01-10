package com.kh.objet.qna.model.service;

import java.util.List;

import com.kh.objet.qna.model.vo.Qna;

public interface QnaService {
	public List<Qna> selectQnaListAdmin ();
	public Qna selectQnaDetailAdmin(int qnano);
	public int insertWriteQna(Qna qna);
	public List<Qna> selectQnaMain ();
}
