package com.kh.objet.qna.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.objet.qna.model.vo.Qna;

public interface QnaService {
	public List<Qna> selectQnaListAdmin();

	public Qna selectQnaDetailAdmin(int qnano);


	List<Qna> selectQnaList(HashMap<String, Object> map);

	public int listCount2();

	public Qna selectQnaDetail(int qnano);

	public int insertQna(Qna qna);

	public int qnaSearchListCount(HashMap<String, Object> mapp);

	public List<Qna> selectQnaSearchList(HashMap<String, Object> map);
	
	public int updateQna(Qna qna);
	public int deleteQna(int qnano);
	public int deleteQna1(int qnano);
	

	   public List<Qna> selectQnaListAdmin(Map<String, String> map);


	   public int selectQnaCountAd(Map<String, String> map);

	   public List<Qna> selectQnaListAdmin5();

	   public int updateQnaAnswer(Qna qna);

	   public int selectQnaCountAd();

	   public int selectQnaCountAnswer();

}
