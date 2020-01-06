package com.kh.objet.guestbook.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.guestbook.model.vo.GB;
import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.paging.model.vo.Paging;

@Repository("guestbookDao")
public class GuestBookDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public GuestBookDao() {}

	
	// 최민영 **************************************
	// 방명록 갯수 가져오기
	public int selectGuestBookListCount(String artistid) {
		return mybatisSession.selectOne("userMapper.selectGuestBookListCount", artistid);
	}
	
	// 방명록 리스트 보기
	public List<GB> selectArtistGuestBook(HashMap<String, Object> map) {
		return mybatisSession.selectList("userMapper.selectArtistGuestBook", map);
	}
	
	
	// 내가 쓴 글 보기 리스트카운트용
	public int selectMyGuestBookListCount(HashMap<String, Object> map1) {
		return mybatisSession.selectOne("userMapper.selectMyGuestBookListCount", map1);
	}
	
	// 내가 쓴 방명록 가져오기
	public List<GB> selectMyGuestBook(HashMap<String, Object> map2) {
		return mybatisSession.selectList("userMapper.selectMyGuestBook", map2);
	}


	// 작가 방명록 검색 리스트 카운트용
	public int selectGuestBookSearchListCount(HashMap<String, Object> map1) {
		return mybatisSession.selectOne("userMapper.selectGuestBookSearchListCount", map1);
	}
	
	// 방명록 검색
	public List<GB> selectGuestBookSearch(HashMap<String, Object> map2) {
		return mybatisSession.selectList("userMapper.selectGuestBookSearch", map2);
	}
	

	

	// 방명록 작성
	public int insertGuestBook(GuestBook guestbook) {
		return mybatisSession.insert("userMapper.insertGuestBook", guestbook);
	}

	// 방명록 비밀글 여부 수정
	public int updateGuestBookPrivate(HashMap<String, Object> map) {
		return mybatisSession.update("userMapper.updateGuestBookPrivate", map);
	}
	
	
	// 방명록 수정
	public int updateGuestBook(int gbno) {
		return mybatisSession.update("", gbno);
	}

	// 방명록 삭제
	public int deleteGuestBook(int gbno) {
		return mybatisSession.delete("userMapper.deleteGuestBook", gbno);
	}


	
	
	// 방명록 댓글부분 ***********************************
	// 방명록 댓글 작성
	public int insertGuestBookReply(GbReply gbreply) {
		return mybatisSession.insert("userMapper.insertGuestBookReply", gbreply);
	}

	// 방명록 댓글 수정
	public int updateGuestBookReply(GbReply gbreply) {
		return mybatisSession.update("", gbreply);
	}

	// 방명록 댓글 삭제
	public int deleteGuestBookReply(int gbno) {
		return mybatisSession.delete("userMapper.deleteGuestBookReply", gbno);
	}

	// 방명록 댓글 작성시 원글 답변 여부 Y로 
	public int updateReplyyn(int gbno) {
		return mybatisSession.update("userMapper.updateReplyyn", gbno);
	}

	// 방명록 댓글 삭제시 원글 답변 여부 N으로 
	public int updateGuestBook2(int gbno) {
		return mybatisSession.update("userMapper.updateReplyyn2", gbno);
	}


	// 아이디 가져오기용
	public String selectUserid(String keyword) {
		return mybatisSession.selectOne("userMapper.selectUserid", keyword);
	}







	
	
	
	
}
