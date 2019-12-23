package com.kh.objet.objet.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.dao.ObjetDao;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;
import com.kh.objet.reportboard.model.vo.ReportBoard;

@Service("objetService")
public class ObjetServiceImpl implements ObjetService{

	@Autowired
	private ObjetDao objetDao;
	
	@Override
	public ArrayList<Objet> selectObjetAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Artist> selectArtistAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertObjetReport(ReportBoard rb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Objet> selectObjetSearchList(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Objet selectObjetOne(int objetno) {
		// TODO Auto-generated method stub
		return null;
	}

	
	// 최민영 *******************************************************
	
	// 작가홈 오브제 리스트카운트
		@Override
		public int selectArtistObjetGetListCount(String userid) {
			return objetDao.selectArtistObjetGetListCount(userid);
		}

	// 작가홈 오브제 리스트 보기
		@Override
		public ArrayList<Objet> selectArtistObjetList(String userid, Paging paging) {
			return objetDao.selectArtistObjetList(userid, paging);
		}
		
		
	// 작가홈 오브제 검색용 리스트카운트
		@Override
		public int selectArtistObjetSearchGetListCount(String objettitle) {
			return objetDao.selectArtistObjetSearchGetListCount(objettitle);
		}

		
	// 작가홈 오브제 검색
		@Override
		public ArrayList<Objet> selectArtistObjetSearch(String objettitle, Paging paging) {
			return objetDao.selectArtistObjetSearch(objettitle, paging);
		}
		
		
		
		
		
	
	// 오브제 관리-내 오브제 페이지 이동
	@Override
	public ArrayList<Objet> moveMyObjetList(String userid, Paging paging) {
		return objetDao.moveMyObjetList(userid, paging);
	}

	//오브제 관리-내 오브제 검색
	@Override
	public ArrayList<Objet> selectMyObjetSearch(String publicyn, String objetstatus, String objettitle, Paging paging) {
		return objetDao.selectMyObjetSearch(publicyn, objetstatus, objettitle,paging);
	}
	
	//오브제 관리 - 내 오브제 상세보기
	@Override
	public Objet moveMyObjetDetail(int objetno) {
		return objetDao.moveMyObjetDetail(objetno);
	}

	
	//오브제 관리 - 내 오브제 수정 페이지 이동
	@Override
	public Objet moveEditObjet(int objetno) {
		return objetDao.moveEditObjet(objetno);
	}

	
	//오브제 관리 - 내 오브제 수정
	@Override
	public int updateMyObjet(Objet objet) {
		return objetDao.updateMyObjet(objet);
	}

	//오브제 관리 - 전시 등록
	@Override
	public int insertObjet(Objet objet) {
		return objetDao.insertObjet(objet);
	}

	// 오브제 관리 - 전시 삭제
	@Override
	public int deleteObjet(int objetno) {
		return objetDao.deleteObjet(objetno);
	}
	
}
