package com.kh.objet.guestbook.model.service;

import java.util.ArrayList;

import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.paging.model.vo.Paging;

public interface GuestBookService {
	// 최민영 **************************************
	int getGuestBookListCount(String userid);
	ArrayList<GuestBook> selectArtistGuestBook(String userid, Paging paging);
	int insertGuestBook(GuestBook guestbook);
	int updateGuestBook(int gbno);
	int deleteGuestBook(int gbno);
	int getGuestBookSearchListCount(String userid);
	ArrayList<GuestBook> selectGuestBookSearch(String userid, String gbcontent, Paging paging);
	
	// 방명록 댓글부분
	int insertGuestBookReply(GbReply gbreply);
	int updateGuestBookReply(GbReply gbreply);
	int ideleteGuestBookReply(int gbno);

}
