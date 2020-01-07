package com.kh.objet.guestbook.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.objet.guestbook.model.vo.GB;
import com.kh.objet.guestbook.model.vo.GbReply;
import com.kh.objet.guestbook.model.vo.GuestBook;
import com.kh.objet.paging.model.vo.Paging;

public interface GuestBookService {
	// 최민영 **************************************
	int selectGuestBookListCount(String artistid);
	List<GB> selectArtistGuestBook(HashMap<String, Object> map);
	int selectMyGuestBookListCount(HashMap<String, Object> map1);
	List<GB> selectMyGuestBook(HashMap<String, Object> map2);
	int selectGuestBookSearchListCount(HashMap<String, Object> map1);
	List<GB> selectGuestBookSearch(HashMap<String, Object> map2);
	
	int insertGuestBook(GuestBook guestbook);
	int updateGuestBookPrivate(HashMap<String, Object> map);
	int updateReplyyn(int gbno);
	int updateGuestBook(GuestBook guestbook);
	int updateGuestBook2(int gbno);
	int deleteGuestBook(int gbno);
	
	
	// 방명록 댓글부분
	int insertGuestBookReply(GbReply gbreply);
	int updateGuestBookReply(GbReply gbreply);
	int deleteGuestBookReply(int gbno);

}
