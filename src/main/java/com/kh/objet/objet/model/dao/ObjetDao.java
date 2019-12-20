package com.kh.objet.objet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
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
	};
}
