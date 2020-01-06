package com.kh.objet.guestbook.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.guestbook.model.dao.GuestBookDao;
import com.kh.objet.guestbook.model.vo.GB;
import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.paging.model.vo.Paging;

@Service("guestbookService")
public class GuestBookServiceImpl implements GuestBookService{

	@Autowired
	private GuestBookDao guestBookDao;

	
	// 최민영 *******************************
	// 방명록 갯수 가져오기
	@Override
	public int selectGuestBookListCount(String artistid) {
		return guestBookDao.selectGuestBookListCount(artistid);
	}
	
	// 방명록 리스트 보기
	@Override
	public List<GB> selectArtistGuestBook(HashMap<String, Object> map) {
		return guestBookDao.selectArtistGuestBook(map);
	}
	
	// 내가 쓴 방명록 보기 리스트카운트용
		public int selectMyGuestBookListCount(HashMap<String, Object> map1) {
			return guestBookDao.selectMyGuestBookListCount(map1);
		}

	// 내가 쓴 방명록 가져오기
	public List<GB> selectMyGuestBook(HashMap<String, Object> map2) {
		return guestBookDao.selectMyGuestBook(map2);
	}

		
		
		
	
	// 방명록 작성
	@Override
	public int insertGuestBook(GuestBook guestbook) {
		return guestBookDao.insertGuestBook(guestbook);
	}

	// 방명록 비밀글 여부 수정
	public int updateGuestBookPrivate(HashMap<String, Object> map) {
		return guestBookDao.updateGuestBookPrivate(map);
	}
	
	
	// 방명록 수정
	@Override
	public int updateGuestBook(int gbno) {
		return guestBookDao.updateGuestBook(gbno);
	}

	
	// 방명록 삭제
	@Override
	public int deleteGuestBook(int gbno) {
		return guestBookDao.deleteGuestBook(gbno);
	}

	

	// 작가 방명록 검색 리스트 카운트용
	public int selectGuestBookSearchListCount(HashMap<String, Object> map1) {
		return guestBookDao.selectGuestBookSearchListCount(map1);
	}
	
	// 방명록 검색
	@Override
	public List<GB> selectGuestBookSearch(HashMap<String, Object> map2) {
		return guestBookDao.selectGuestBookSearch(map2);
	}
	
	
	
	// 방명록 댓글부분 ***********************************
	// 방명록 댓글 작성
	@Override
	public int insertGuestBookReply(GbReply gbreply) {
		return guestBookDao.insertGuestBookReply(gbreply);
	}

	// 방명록 댓글 수정
	@Override
	public int updateGuestBookReply(GbReply gbreply) {
		return guestBookDao.updateGuestBookReply(gbreply);
	}

	// 방명록 댓글 삭제
	@Override
	public int deleteGuestBookReply(int gbno) {
		return guestBookDao.deleteGuestBookReply(gbno);
	}
	// 방명록 댓글 작성시 원글 답변 여부 Y로 
	public int updateReplyyn(int gbno) {
		return guestBookDao.updateReplyyn(gbno);
	}

	// 방명록 댓글 삭제시 원글 답변 여부 N으로 
	public int updateGuestBook2(int gbno) {
		return guestBookDao.updateGuestBook2(gbno);
	}

	// 아이디 가져오기 용
	public String selectUserid(String keyword) {
		return guestBookDao.selectUserid(keyword);
	}


	


	
}
