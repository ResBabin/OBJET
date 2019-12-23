package com.kh.objet.guestbook.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.guestbook.model.dao.GuestBookDao;
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
	public int getGuestBookListCount(String userid) {
		return guestBookDao.getGuestBookListCount(userid);
	}
	
	// 방명록 리스트 보기
	@Override
	public ArrayList<GuestBook> selectArtistGuestBook(String userid, Paging paging) {
		return guestBookDao.selectArtistGuestBook(userid, paging);
	}
	
	// 방명록 작성
	@Override
	public int insertGuestBook(GuestBook guestbook) {
		return guestBookDao.insertGuestBook(guestbook);
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

	// 방명록 검색 리스트카운트
	@Override
	public int getGuestBookSearchListCount(String userid) {
		return guestBookDao.getGuestBookSearchListCount(userid);
	}
	
	// 방명록 검색
	@Override
	public ArrayList<GuestBook> selectGuestBookSearch(String userid, String gbcontent, Paging paging) {
		return guestBookDao.selectGuestBookSearch(userid,gbcontent,paging);
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
	public int ideleteGuestBookReply(int gbno) {
		return guestBookDao.ideleteGuestBookReply(gbno);
	}


	
}
