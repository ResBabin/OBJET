package com.kh.objet.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public NoticeDao() {}

	public List<Notice> selectNoticeList(){
		return mybatisSession.selectList("adminMapper.selectNoticeList");
	}
	
	public Notice selectNoticeDetail(int noticeno) {
		return mybatisSession.selectOne("adminMapper.selectNoticeDetail", noticeno);
	}
}
