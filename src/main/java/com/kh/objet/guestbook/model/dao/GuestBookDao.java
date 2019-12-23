package com.kh.objet.guestbook.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int getGuestBookListCount(String userid) {
		return mybatisSession.selectOne("", userid);
	}
	
	// 방명록 리스트 보기
	public ArrayList<GuestBook> selectArtistGuestBook(String userid, Paging paging) {
			int offset = 0;
			int limit = 0;
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			List<GuestBook> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<GuestBook>)list;
	}


	// 방명록 작성
	public int insertGuestBook(GuestBook guestbook) {
		return mybatisSession.insert("", guestbook);
	}

	// 방명록 수정
	public int updateGuestBook(int gbno) {
		return mybatisSession.update("", gbno);
	}

	// 방명록 삭제
	public int deleteGuestBook(int gbno) {
		return mybatisSession.delete("", gbno);
	}

	// 방명록 검색 리스트카운트
	public int getGuestBookSearchListCount(String userid) {
		return mybatisSession.selectOne("", userid);
	}

	// 방명록 검색
	public ArrayList<GuestBook> selectGuestBookSearch(String userid, String gbcontent, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 검색용 vo 따로 만들어야 할 듯
		List<GuestBook> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<GuestBook>)list;
	}

	
	
	// 방명록 댓글부분 ***********************************
	// 방명록 댓글 작성
	public int insertGuestBookReply(GbReply gbreply) {
		return mybatisSession.insert("", gbreply);
	}

	// 방명록 댓글 수정
	public int updateGuestBookReply(GbReply gbreply) {
		return mybatisSession.update("", gbreply);
	}

	// 방명록 댓글 삭제
	public int ideleteGuestBookReply(int gbno) {
		return mybatisSession.delete("", gbno);
	}

	
	
	
	
}
