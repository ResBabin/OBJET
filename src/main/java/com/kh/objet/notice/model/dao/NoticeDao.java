package com.kh.objet.notice.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.notice.model.vo.Notice;
import com.kh.objet.notice.model.vo.SearchDate;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	
	public NoticeDao() {}
	
	//공지사항 목록불러오기
	public List<Notice> selectNoticeList1(){
		return mybatisSession.selectList("csMapper.selectNoticeList");
	}
	
	//공지사항 세부목록 보기
	public Notice selectNoticeDetail1(int noticeno) {
		return mybatisSession.selectOne("csMapper.selectNoticeDetail", noticeno);
	}
	//공지사항 전체목록 세기
	public int countNotice() {
		return mybatisSession.selectOne("csMapper.selectCountNotice");
	}
	//공지사항 제목검색
	public List<Notice> selectSearchNoticeTitle(String keyword){
		return mybatisSession.selectList("csMapper.searchNoticeTitle", keyword);
		
	}
	//공지사항 날짜 검색
	public List<Notice> selectSearchNoticeDate(SearchDate searchDate) {
		return mybatisSession.selectList("csMapper.searchNoticeDate", searchDate);
		
	}
	////////////////////////////////////////////////////////관리자//////////////////////////////////////////////////////////

	public List<Notice> selectNoticeList(){
		return mybatisSession.selectList("adminMapper.selectNoticeList");
	}
	
	public Notice selectNoticeDetail(int noticeno) {
		return mybatisSession.selectOne("adminMapper.selectNoticeDetail", noticeno);
	}

	public List<Notice> selectNoticeListAsc() {
		return mybatisSession.selectList("adminMapper.selectNoticeListAsc");
	}

	

	
}
