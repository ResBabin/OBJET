package com.kh.objet.objet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;
import com.sun.rowset.internal.Row;

@Repository("objetDao")
public class ObjetDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;	
	
	public ObjetDao() {}
	
	public ArrayList<Objet> selectObjetAllList(){
		List<Objet> list = mybatisSession.selectList("objetMapper.selectObjetAll");
		return (ArrayList<Objet>)list;
	}
	
	ArrayList<Artist> selectArtistAllList(){
		List<Artist> list = mybatisSession.selectList("objetMapper.selectArtistAll");
		return (ArrayList<Artist>)list;
	}
	
	int insertObjetReport(ReportBoard rb) {
		return mybatisSession.insert("objetMapper.insertMember", rb);
	}
	
	ArrayList<Objet> selectObjetSearchList(String keyword){
		List<Objet> list = mybatisSession.selectList("objetMapper.objetSearchList", keyword);
		return (ArrayList<Objet>)list;
	}
	
	Objet selectObjetOne(int objetno) {
		return mybatisSession.selectOne("objetMapper.selectObjetOne", objetno);
	}
	
	
	// 최민영
	// 작가홈 오브제 리스트카운트
	public int selectArtistObjetGetListCount(String userid) {
		return mybatisSession.selectOne("", userid);
	}

	// 작가홈 오브제 리스트 보기
	public ArrayList<Objet> selectArtistObjetList(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Objet> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<Objet>) list;
	}

	// 작가홈 오브제 검색용 리스트카운트
	public int selectArtistObjetSearchGetListCount(String objettitle) {
		return mybatisSession.selectOne("", objettitle);
	}

	// 작가홈 오브제 검색
	public ArrayList<Objet> selectArtistObjetSearch(String objettitle, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Objet> list = mybatisSession.selectList("", objettitle, rowBounds);
		return (ArrayList<Objet>) list;
	}

	
	
	
	
	
	// 오브제 관리-내 오브제 페이지 이동
	public ArrayList<Objet> moveMyObjetList(String userid, Paging paging) {
		int offset = 0;
		int limit = 0;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Objet> list = mybatisSession.selectList("", userid, rowBounds);
		return (ArrayList<Objet>) list;
	}

	//오브제 관리-내 오브제 검색
	public ArrayList<Objet> selectMyObjetSearch(String publicyn, String objetstatus, String objettitle, Paging paging) {
		//검색용 vo 새로 만들어야 할듯
		return null;
	}

	//오브제 관리 - 내 오브제 상세보기
	public Objet moveMyObjetDetail(int objetno) {
		return mybatisSession.selectOne("", objetno);
	}

	//오브제 관리 - 내 오브제 수정 페이지 이동
	public Objet moveEditObjet(int objetno) {
		return mybatisSession.selectOne("", objetno);
	}

	//오브제 관리 - 내 오브제 수정
	public int updateMyObjet(Objet objet) {
		return mybatisSession.update("", objet);
	}

	//오브제 관리 - 전시 등록
	public int insertObjet(Objet objet) {
		return mybatisSession.insert("", objet);
	}

	// 오브제 관리 - 전시삭제
	public int deleteObjet(int objetno) {
		return mybatisSession.delete("", objetno);
	};
	
}
