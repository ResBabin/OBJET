package com.kh.objet.qna.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.objet.qna.model.vo.Qna;

public interface QnaService {
	public List<Qna> selectQnaListAdmin();

	public Qna selectQnaDetailAdmin(int qnano);

	public int insertWriteQna(Qna qna);

	public List<Qna> selectQnaMain();

	List<Qna> selectQnaList(HashMap<String, Object> map);

	public int listCount2();

	public Qna selectQnaDetail(int qnano);

	public int insertQna(Qna qna);

	public int qnaSearchListCount(HashMap<String, Object> mapp);

	public List<Qna> selectQnaSearchList(HashMap<String, Object> map);
}
