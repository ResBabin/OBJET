package com.kh.objet.objet.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.dao.ObjetDao;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
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
	
	
}
