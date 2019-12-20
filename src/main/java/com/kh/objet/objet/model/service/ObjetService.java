package com.kh.objet.objet.model.service;

import java.util.ArrayList;

import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.reportboard.model.vo.ReportBoard;

public interface ObjetService {
	
	ArrayList<Objet> selectObjetAllList();
	ArrayList<Artist> selectArtistAllList();
	int insertObjetReport(ReportBoard rb);
	ArrayList<Objet> selectObjetSearchList(String keyword);
	Objet selectObjetOne(int objetno);
}
